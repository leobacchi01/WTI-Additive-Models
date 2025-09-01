# WTI-Additive-Models
Calibration and simulation of Additive Bachelier model and Additive Logistic model on WTI oil options (June 2020)

## Overview
This project explores the calibration and application of two additive option pricing models — the **Additive Bachelier model** and the **Additive Logistic model** — using European options on WTI crude oil observed on **2nd June 2020**.  
The focus is on recovering discount factors and forward prices directly from market option data, calibrating the two models, and finally applying them to the pricing of an exotic derivative payoff.

---

## Discount Factors and Market Conditions
The first step consisted of calibrating forward and discount factors from the mid prices of calls and puts across different maturities and strikes.  
The calibration was carried out through a regression-based approach that exploits synthetic forwards to recover discount factors without relying on external interest rate data.  

The results reflected the extraordinary market conditions of **April 2020**, when WTI futures briefly turned negative. In this period, discount factors did not follow the classical monotonic decreasing pattern but instead displayed non-standard dynamics due to extreme demand for short-term liquidity and unprecedented uncertainty.

---

## Additive Bachelier Model
The Bachelier framework was adopted by exchanges during the Covid crisis to handle the possibility of negative prices.  
In this project, we implemented the **Additive Bachelier model**, characterized by:
- An additive forward process with a known characteristic function.
- Calibration performed in two steps:
  1. **ATM volatilities** were matched first.
  2. **Smile parameters** η (skewness) and κ (vol-of-vol) were estimated using out-of-the-money options.

The model successfully reproduced the observed volatility term structure, with η capturing the left skew of the market and κ providing curvature consistent with volatility smiles.  

---

## Additive Logistic Model
Next, we calibrated the **Additive Logistic (Self-Similar Logistic Additive, SSLA) model**, defined through two parameters: σ and H.  
This model provides closed-form formulas for European call and put prices and is able to reproduce ATM volatilities with a flexible scaling behavior.  

The calibration showed that while the Logistic model captured the **shape** and **curvature** of the ATM term structure, its volatility levels were consistently lower than market values and those of the Bachelier model. The discrepancy was more evident for short maturities, while for longer horizons the two models converged.

---

## Exotic Option Pricing
Finally, we applied both models to price a **binary-style exotic payoff** with notional USD 20 million.  
The payoff depends on the average of forward contracts across the quoted expiries, maturing on **16 November 2022**:

Payoff=1{(1/N​)*∑Fti​,tN​​  >  K}​,  K=Ft0​,tN​​.

Where 𝑡𝑖, 𝑖=1,…,𝑁 are the expiries of the quoted European options (with 𝑡𝑁 equal to the 16th November 2022) and 𝐹𝑡𝑖,𝑡𝑁 is defined as the forward expiring in 𝑡𝑁 valued at time 𝑡i.

Pricing was performed via **Monte Carlo simulations** using the **Lewis-FFT method** to generate paths from the calibrated characteristic functions.  

Results:
- **Additive Bachelier**: ~10.16 M USD  
- **Additive Logistic**: ~10.13 M USD  

The close agreement highlights the robustness of both models for exotic pricing under stressed market conditions.

---

## References
- Azzone & Baviera (2023): *A fast Monte Carlo scheme for additive processes and option pricing*  
- Azzone & Baviera (2021): *Synthetic forwards and cost of funding in the equity derivative market*  
- Baviera & Massaria (2025): *The Additive Bachelier model with an application to the oil option market in the Covid period*  
- Carr & Torricelli (2021): *Additive logistic processes in option pricing* 
