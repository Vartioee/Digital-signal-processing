# Discrete-Time Signal Processing and Filtering Assignment

## Answers to Questions

### 1. Which operation changed the signal amplitude?
The **amplitude scaling** operation in Task 1 (`scaled = 2 * measured`) doubled the amplitude of the measured signal. This doubled both the clean-signal component and the noise.

---

### 2. How did the five-sample delay change the signal?
The delay shifted the signal 5 samples to the right along the sample-index axis. Its shape, frequency, and amplitude remained unchanged. The code prepended five zeros, so the delayed sequence is five samples longer than the original.

---

### 3. What does the impulse response $h[n]$ represent?
The impulse response $h[n]$ is a system’s output when its input is the unit impulse $\delta[n]$, which is 1 at $n=0$ and 0 elsewhere.

---

### 4. How did convolution change the noisy signal?
Convolution with the moving-average impulse response smoothed the signal by averaging neighboring samples. This reduced rapid noise fluctuations and generally brought the result closer to the underlying sine wave. Smoothing also attenuates some of the signal’s amplitude.

---

### 5. What differences did you observe between the 5-point and 15-point filters?
- **Smoothness:** The 15-point filter produced a smoother signal because it averages over a wider window.
- **Amplitude reduction:** The 15-point filter attenuated the sine wave’s peaks and troughs more than the 5-point filter.
- **Boundary effects:** The 15-point filter showed greater distortion near the signal boundaries. The code uses `conv(..., 'same')`, which introduces boundary effects because samples outside the signal are effectively treated as zero.
- **Phase:** Both filters are symmetric, centered moving averages, so they do not introduce a phase shift in the interior of the signal.

---

### 6. Which filter removed more noise?
The **15-point filter** smoothed out more rapid noise variation because it averages over more samples. However, it also attenuated the underlying sine wave more.

---

### 7. Did the longer filter remove or distort useful signal information?
**Yes.** The 15-point filter attenuated the sine wave’s peaks and troughs. The clean signal has a period of 20 samples, so a 15-sample window spans 75% of a cycle. This wide window averages together substantially different parts of the waveform.

---

### 8. Which filter would you recommend for this signal? Explain your decision.
I recommend the **5-point moving-average filter** as a compromise between noise reduction and preservation of the sine wave.

The clean signal’s period is
$T = \frac{2\pi}{0.1\pi} = 20$ samples.
A 5-sample window is shorter than the 15-sample window, so it preserves more of the sine wave’s amplitude while still smoothing some noise.

---

### 9. Give one real engineering application for moving-average filtering.
**Signal smoothing in biomedical measurement:** A short moving-average filter can smooth high-frequency fluctuations in measurements such as ECG signals before further analysis. The window must be chosen carefully to avoid distorting important waveform features. A moving average is not usually the preferred method for removing 50/60 Hz power-line interference; a notch filter is more appropriate for that purpose.

## AI Usage

Tool used: Gemini 3.5

How I used it: I asked it to help create the README from my answers, correct spelling mistakes, verify my findings with sources, explain how to save figures as PNG files, and comment the code.

What I verified or changed: I reviewed the generated text and comments, checked the sources, and corrected the answers.