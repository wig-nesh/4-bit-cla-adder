## nand

### cmos

```jsx
t_delay             =  6.50541e-11
```

```jsx
.subckt nand_cmos A B Y 
    MnA Y A   x gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnB x B gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MpA Y A vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpB Y B vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends
```

## inv

### cmos

```jsx
t_delay             =  2.50056e-11
```

```jsx
.subckt inv_cmos OUT IN
    Mn OUT IN gnd gnd CMOSN W={width_N} L={2*LAMBDA} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    Mp OUT IN vdd vdd CMOSP W={width_P} L={2*LAMBDA} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends INV
```

## d ff

### cmos

```jsx
t_delay             =  1.06621e-10
```

```jsx
.subckt d_ff_cmos D clk Q Qi
    .subckt inv_cmos IN OUT
        Mn OUT IN gnd gnd CMOSN W={width_N} L={2*LAMBDA} 
        + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
        + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
        Mp OUT IN vdd vdd CMOSP W={width_P} L={2*LAMBDA} 
        + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
        + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    .ends INV
    .subckt nand_cmos A B Y 
        MnA Y A   x gnd CMOSN W={width_N} L={length} 
        + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
        + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
        MnB x B gnd gnd CMOSN W={width_N} L={length} 
        + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
        + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
        MpA Y A vdd vdd CMOSP W={width_P} L={length} 
        + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
        + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
        MpB Y B vdd vdd CMOSP W={width_P} L={length} 
        + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
        + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    .ends
    Xinv    D     Di inv_cmos
    Xnand1  D clk  x nand_cmos
    Xnand2 Di clk  y nand_cmos
    Xnand3  x  Qi  Q nand_cmos
    Xnand4  y   Q Qi nand_cmos
.ends
```