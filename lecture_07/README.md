# Environmental Sound Analysis: Crackling Fire

This analysis looks at the sound of a woodfire and compares how different STFT window sizes show its features.

## Audio Clip

- **Source file:** `classification/3-140774-A-10.wav` from dataset provided for the lecture
- **Sampling rate:** 16,000 Hz
- **Duration:** 5 seconds

## STFT Settings

- **Hop length:** 160 samples (10 ms)
- **512-sample window (~32 ms):** Shows short, sharp crackles more clearly.
- **2048-sample window (~128 ms):** Shows frequency detail in the quieter background more clearly.

## Observations

- The sharp crackles have energy across a wide range of frequencies, including above 6,000 Hz. They appear as short vertical marks in the spectrogram with the 512-sample window.
- The low rumble and soft hiss are concentrated mostly below 1,500 Hz. They appear as horizontal bands with the 2048-sample window.

## Limitations

- A short window gives better timing detail, while a longer window gives better frequency detail. One window size cannot show both equally well.
- The spectrogram shows the recorded sound, including room reverberation, so it cannot separate the fire from the room's effect on the recording.

## Running the Analysis

Run the cells in `analysis.ipynb` in order after the .ipynb file provided for the lecture to reproduce the plots. Use an activated virtual environment with `numpy<2.0.0` and `scipy==1.15.3` installed.
