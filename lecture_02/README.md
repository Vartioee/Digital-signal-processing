# Nyquist Analysis & Aliasing 

## Nyquist Analysis

### Minimum Sampling Frequency Calculation

The Nyquist Sampling Theorem requires the sampling frequency to be at least twice the highest frequency present in the signal:

$$f_{\text{Nyquist}} = 2 \cdot f_{\max}$$

Given:
* Maximum signal frequency, $f_{\max} = 10\text{ Hz}$

Calculation:
$$f_{s,\min} = 2 \times 10\text{ Hz} = 20\text{ Hz}$$

---

### Questions & Answers

1. **Which sampling frequencies satisfy the Nyquist criterion?**
   * **Satisfies ($f_s > 20\text{ Hz}$):** 
     * **$25\text{ Hz}$** (captures some shape, though not accurate) not recommended for use
     * **$50\text{ Hz}$** (reconstructs the $10\text{ Hz}$ sine wave accurately)
     * **$100\text{ Hz}$** (provides high resolution and clean reconstruction)
   * **Does NOT satisfy ($f_s \le 20\text{ Hz}$):**
     * **$15\text{ Hz}$** (suffers from aliasing, reconstructing an erroneous lower frequency)
     * **$20\text{ Hz}$** (samples hit the zero-crossings every $0.05\text{ s}$, resulting in a constant zero line with total amplitude loss)

2. **Is sampling exactly at the Nyquist rate recommended in practice? Explain your answer.**
   * No. As demonstrated in the $20\text{ Hz}$ plot, if sampling aligns with the zero-crossings of the sine wave, the measured signal becomes a constant zero line, completely losing the waveform's amplitude and phase information.

---

## Aliasing Discussion

Aliasing occurs at sampling frequencies strictly lower than or equal to the Nyquist rate, specifically at **$15\text{ Hz}$** and **$20\text{ Hz}$** in the provided plots. It happens because discrete sampling below two samples per cycle cannot uniquely distinguish high-frequency signals from lower-frequency "alias" signals, causing higher frequencies to fold back into the baseband spectrum.

For a real engineering system, a sampling frequency of **$50\text{ Hz}$ to $100\text{ Hz}$** (5 to 10 times $f_{\max}$) is recommended. 

**Engineering Justification:**
Oversampling at 5–10× $f_{\max}$ captures peak amplitudes and signal shape.
While $100\text{ Hz}$ provides higher accuracy, $50\text{ Hz}$ offers an optimal trade-off by preserving wave shape while reducing computational overhead, memory storage, and power consumption.
A sampling rate well above $20\text{ Hz}$ provides a sufficient safety margin against high-frequency noise and relaxes the roll-off steepness required for hardware anti-aliasing low-pass filters.


# AI Verification Report

**AI Tool Used:** Gemini 3.5

---

## Prompt
> I explained the topic, investigation and my findings in my own words. Then I asked to create a .md and verify if I understood the subjects correctly with sources. 
---

## Summary of the AI Response
> Gemini responed with verifying my awnsers with sources and creating the .md file.

---

## What I Modified
> Modified the .md to my liking and verified from the sources my own understanding.