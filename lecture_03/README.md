# Discrete-Time Signal Processing and Filtering Assignment

## Answers to Questions

### 1. Which operation changed the signal amplitude?
The **amplitude scaling** operation in Task 1 (`scaled = 2 * measured`) changed the signal amplitude. Multiplying the signal by 2 doubled both the underlying clean signal values and the noise amplitude across all samples.

---

### 2. How did the five-sample delay change the signal?
The delay shifted the entire signal to the right by 5 units along the sample index ($n$) axis. 
- The overall shape, frequency, and amplitude of the waveform remained unchanged.
- The signal array was extended in length by 5 samples due to the prepended zeros representing the initial zero-state response.

---

### 3. What does the impulse response $h[n]$ represent?
The impulse response $h[n]$ is the system's output when the input is a discrete unit impulse function $\delta[n]$ (a single spike of amplitude 1 at $n = 0$ and 0 elsewhere).

---

### 4. How did convolution change the noisy signal?
Convolution with the moving-average impulse response acted as a low-pass filter. It averaged neighboring sample values together, which smoothed out the high-frequency random noise and brought the signal closer to the underlying sine wave.

---

### 5. What differences did you observe between the 5-point and 15-point filters?
- **Smoothness:** The 15-point filter produced a noticeably smoother line than the 5-point filter because it averages over a wider window.
- **Amplitude Reduction (Attenuation):** The 15-point filter attenuated (flattened) the peak and trough amplitudes of the underlying sine wave significantly more than the 5-point filter.
- **Phase Shift / Edge Effects:** The 15-point filter introduced more boundary distortion near the edges ($n \approx 0$ and $n \approx 100$).

---

### 6. Which filter removed more noise?
The **15-point filter** removed more noise. By taking the average across 15 samples instead of 5, high-frequency random variations were cancelled out more effectively.

---

### 7. Did the longer filter remove or distort useful signal information?
**Yes.** The 15-point filter caused noticeable distortion:
1. It suppressed the peak amplitudes of the original sine wave because the window size (15 samples) covers a significant fraction of the sine wave's period (20 samples for $\sin(0.1\pi n)$).
2. It flattened out sharp transitions, causing a loss of signal dynamics and peak accuracy.

---

### 8. Which filter would you recommend for this signal? Explain your decision.
I recommend the **5-point moving-average filter**. 
- **Reasoning:** The period of the clean sine wave is $T = \frac{2\pi}{0.1\pi} = 20$ samples. 
- A 5-point filter window spans $25\%$ of a cycle, providing a good trade-off between reducing noise fluctuations and preserving the true peak amplitudes of the sine wave. 
- The 15-point filter spans $75\%$ of the signal period, which severely clips the wave's peaks and introduces excessive distortion.

---

### 9. Give one real engineering application for moving-average filtering.
**ECG (Electrocardiogram) Signal Processing:** In biomedical engineering, moving-average filters are routinely used to remove high-frequency muscular noise or power-line interference ($50\text{ Hz} / 60\text{ Hz}$) from raw ECG heart-rate signals before automatic peak detection algorithms analyze the heartbeat.

## AI Usage

Tool used: Gemini 3.5

How I used it: I asked to create README code from the awnsers I gave, correct spelling mistakes and verify my findings with sources. Asked how to autosave figures to pngs and comment the code.

What I verified or changed: I verified the sources and proof read the text after RAEDME code generations and comments added. 