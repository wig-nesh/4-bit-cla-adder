## cmos

```jsx
delay_s3_r          =  3.744321e-10 targ=  1.367210e-09 trig=  9.927778e-10
delay_s2_r          =  3.870793e-10 targ=  1.379857e-09 trig=  9.927778e-10
delay_s1_r          =  3.957535e-10 targ=  1.388531e-09 trig=  9.927778e-10
delay_s0_r          =  9.912402e-11 targ=  1.091902e-09 trig=  9.927778e-10
delay_c4_r          =  2.247231e-10 targ=  1.217501e-09 trig=  9.927778e-10
delay_s3_f          =  4.774251e-10 targ=  4.474647e-09 trig=  3.997222e-09
delay_s2_f          =  4.559303e-10 targ=  4.453153e-09 trig=  3.997222e-09
delay_s1_f          =  4.425705e-10 targ=  4.439793e-09 trig=  3.997222e-09
delay_s0_f          =  1.585154e-10 targ=  4.155738e-09 trig=  3.997222e-09
delay_c4_f          =  3.261772e-10 targ=  4.323399e-09 trig=  3.997222e-09
```

## optimized

- rise time is worse (fall time slightly better) , but much less area
- better xor, 12->6 transistors

```jsx
delay_s3_r          =  5.626413e-10 targ=  1.555419e-09 trig=  9.927778e-10
delay_s2_r          =  5.743150e-10 targ=  1.567093e-09 trig=  9.927778e-10
delay_s1_r          =  5.826638e-10 targ=  1.575442e-09 trig=  9.927778e-10
delay_s0_r          =  3.046713e-10 targ=  1.297449e-09 trig=  9.927778e-10
delay_c4_r          =  2.254889e-10 targ=  1.218267e-09 trig=  9.927778e-10
delay_s3_f          =  4.162841e-10 targ=  4.413506e-09 trig=  3.997222e-09
delay_s2_f          =  3.992833e-10 targ=  4.396506e-09 trig=  3.997222e-09
delay_s1_f          =  3.826005e-10 targ=  4.379823e-09 trig=  3.997222e-09
delay_s0_f          =  1.213281e-10 targ=  4.118550e-09 trig=  3.997222e-09
delay_c4_f          =  3.249355e-10 targ=  4.322158e-09 trig=  3.997222e-09
```