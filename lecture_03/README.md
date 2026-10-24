# Discrete-Time Signal Processing and Filtering Assignment

### 1. Which operation changed the signal amplitude?
The operation in Task 1 (`scaled = 2 * measured`) doubled the amplitude of the measured signal.

---

### 2. How did the five-sample delay change the signal?
The delay shifted the signal 5 samples to the right on x axis. Its shape, frequency, and amplitude stayed the same. The code added five zeros, so the delayed measurement is five samples longer than the original.

---

### 3. What does the impulse response $h[n]$ represent?
The impulse response $h[n]$ is a system’s output when its input is the unit impulse $\delta[n]$.

---

### 4. How did convolution change the noisy signal?
Convolution is smoothing so it creates averages from values around the measurement point to reduce signal noise and peaks. Convolution brought the result closer to the underlying sine wave. Larger parameter smoothing also attenuates the signal’s amplitude.

---

### 5. What differences did you observe between the 5-point and 15-point filters?
- The 15-point filter produced a smoother signal because it averages over a wider window.
- The 15-point filter attenuated the sine wave’s peaks more than the 5-point filter creating a signal far from the original's aplitude.
- Both filters are symmetric, centered moving averages, so they do not introduce a phase shift in the interior of the signal.

---

### 6. Which filter removed more noise?
The 15-point filter smoothed out more rapid noise variation because it averages over more samples. However, it also attenuated the sine wave more, making 5-point filter more accurate compared to original signal.

---

### 7. Did the longer filter remove or distort useful signal information?
Yes. The clean signal has a period of 20 samples, so a 15-sample window spans 75% of a cycle. This wide window averages together substantially different parts of the waveform.

---

### 8. Which filter would you recommend for this signal? Explain your decision.
I recommend the 5-point moving-average filter as a overall good between noise reduction and signals amplitude preservation.

The clean signal’s period is
$T = \frac{2\pi}{0.1\pi} = 20$ samples.
A 5-sample window is shorter than the 15-sample window, so it preserves more of the sine wave’s amplitude while still smoothing the sharpest peaks.

---

### 9. Give one real engineering application for moving-average filtering.
Moving-average filters can be used to smooth out sensor telemetry (like temperature readings). They help filter out random fluctuations like from air currents after window was opened.

## AI Usage

Tool used: Gemini 3.5

How I used it: I asked it to help create the README from my answers, correct spelling mistakes, explain how to save figures as PNG files, and comment the code.

What I verified or changed: I reviewed the generated text and comments, checked the sources, and verified the answers were what I wrote.
