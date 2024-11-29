#!/bin/bash

NGSPICE_CMD="ngspice"
SIM_DIR="../pre_post_layout_simulation/full_ckt/optimized/post_layout"
CIRCUIT_FILE="full_optimized_load_post.cir"

# Get inputs for two 4-bit numbers and carry-in
read -p "Enter the first 4-bit number (A): " numA
read -p "Enter the second 4-bit number (B): " numB
read -p "Enter the carry-in (Cin, 0 or 1): " carry_in

# Convert numbers to binary and pad with zeros to ensure they are 4 bits
binA=$(printf "%04d" $(echo "obase=2; $numA" | bc))
binB=$(printf "%04d" $(echo "obase=2; $numB" | bc))

# Define a function to generate the correct PWL string based on the bit value
generate_pwl_line() {
    local node=$1
    local bit=$2
    if [ "$bit" -eq 1 ]; then
        echo "$node gnd PWL(1.99ns 0V 2ns SUPPLY 7.99ns SUPPLY 8ns 0)"
    else
        echo "$node gnd PWL(1.99ns 0V 2ns 0 7.99ns 0 8ns 0)"
    fi
}

# Generate PWL lines for each bit of A, B, and Cin
pwlA=(
    "vinA3 $(generate_pwl_line A3 ${binA:0:1})"
    "vinA2 $(generate_pwl_line A2 ${binA:1:1})"
    "vinA1 $(generate_pwl_line A1 ${binA:2:1})"
    "vinA0 $(generate_pwl_line A0 ${binA:3:1})"
)
pwlB=(
    "vinB3 $(generate_pwl_line B3 ${binB:0:1})"
    "vinB2 $(generate_pwl_line B2 ${binB:1:1})"
    "vinB1 $(generate_pwl_line B1 ${binB:2:1})"
    "vinB0 $(generate_pwl_line B0 ${binB:3:1})"
)
pwlCin="vinC0 $(generate_pwl_line C0 $carry_in)"

# Change to the simulation directory
cd $SIM_DIR || { echo "Error: Failed to change directory to '$SIM_DIR'."; exit 1; }

# Replace lines in the NGSPICE circuit file
sed -i "s|^vinA3.*|${pwlA[0]}|" "$CIRCUIT_FILE"
sed -i "s|^vinA2.*|${pwlA[1]}|" "$CIRCUIT_FILE"
sed -i "s|^vinA1.*|${pwlA[2]}|" "$CIRCUIT_FILE"
sed -i "s|^vinA0.*|${pwlA[3]}|" "$CIRCUIT_FILE"
sed -i "s|^vinB3.*|${pwlB[0]}|" "$CIRCUIT_FILE"
sed -i "s|^vinB2.*|${pwlB[1]}|" "$CIRCUIT_FILE"
sed -i "s|^vinB1.*|${pwlB[2]}|" "$CIRCUIT_FILE"
sed -i "s|^vinB0.*|${pwlB[3]}|" "$CIRCUIT_FILE"
sed -i "s|^vinC0.*|$pwlCin|" "$CIRCUIT_FILE"

# Run NGSPICE simulation
echo "Running NGSPICE simulation for post-layout circuit..."
$NGSPICE_CMD $CIRCUIT_FILE

echo "Simulation finished. Check 'output.log' for results."
