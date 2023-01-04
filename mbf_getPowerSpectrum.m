function props = mbf_getPowerSpectrum(units, values)
    Fs = 1000;
    L = length(units);
    Y = fft(values);
    P2 = abs(Y / L);
    P1 = P2(1:L / 2 + 1);
    P1(2:end-1) = 2 * P1(2:end - 1);
    f = Fs * (0:(L / 2)) / L;
    props.frequency = f;
    props.power = P1;
end