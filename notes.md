## inv

### cmos

```jsx
t_delay             =  2.50056e-11
```

```jsx
.subckt inv_cmos IN OUT
    Mn OUT IN gnd gnd CMOSN W={width_N} L={2*LAMBDA} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    Mp OUT IN vdd vdd CMOSP W={width_P} L={2*LAMBDA} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends
```

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

cmos 3 input

```jsx
t_delay             =  1.19047e-10
```

```jsx
.subckt nand_3_cmos A B C Y 
    MnA Y A   x gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnB x B   z gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnC z C gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MpA Y A vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpB Y B vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpC Y C vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends
```

cmos 4 input

```jsx
t_delay             =  1.87060e-10
```

```jsx
.subckt nand_4_cmos A B C D Y 
    MnA Y A   x gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnB x B   z gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnC z C   w gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnD w D gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MpA Y A vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpB Y B vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpC Y C vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpD Y D vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends
```
## nor

### cmos

```jsx
t_delay             =  3.10326e-11
```

```jsx
.subckt nor_cmos A B Y 
    MnA Y A gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnB Y B gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MpA x A vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpB Y B   x vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends
```

### cmos 3 input

```jsx
t_delay             =  3.46705e-11
```

```jsx
.subckt nor_3_cmos A B C Y 
    MnA Y A gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnB Y B gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnC Y C gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MpA x A vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpB z B   x vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpC Y C   z vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends
```

### cmos 4 input

```jsx
t_delay             =  3.93739e-11
```

```jsx
.subckt nor_4_cmos A B C D Y 
    MnA Y A gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnB Y B gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnC Y C gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnD Y D gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MpA x A vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpB z B   x vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpC w C   z vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpD Y D   w vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends
```

## xor

### cmos

```jsx
t_delay             =  7.46056e-11
```

```jsx
.subckt xor_cmos A B Y 
    .subckt inv_cmos IN OUT
        Mn OUT IN gnd gnd CMOSN W={width_N} L={2*LAMBDA} 
        + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
        + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
        Mp OUT IN vdd vdd CMOSP W={width_P} L={2*LAMBDA} 
        + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
        + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    .ends
    XinvA A Ai inv_cmos
    XinvB B Bi inv_cmos
    MnA  Y A    x gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnB  x B  gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnAi Y Ai   z gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MnBi z Bi gnd gnd CMOSN W={width_N} L={length} 
    + AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} 
    + AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
    MpA  w A  vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpB  w B  vdd vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpAi Y Ai   w vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
    MpBi Y Bi   w vdd CMOSP W={width_P} L={length} 
    + AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} 
    + AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends
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