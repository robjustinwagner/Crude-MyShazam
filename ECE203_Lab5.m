%% ECE203 - Lab 5
%% 4.1
% The spectrum in the warm-up did not consist of two perfect peaks because
% a DFT was done, i.e. only a certain amount of components of the sinusoid
% were obtained. Since these discrete points must be interpolated through
% in order to create a spectrum, an exact function of the spectrum was not
% obtained, and the "noise" is seen in these non-perfect peaks
%% 4.2
%a.)
% The song will be of length of the number of samples N, multiplied by the
% sampling frequency, which is the sampling frequency
warning('off');
% Save orginal value of x
xtemp=x;
%_________________________________________________________________________
songLength = length(x)*((fs)^-1);
disp('The song is 23.7772 seconds long');

%b.)
N=length(x);
fhat=(-N/2:N/2-1)/N;
fHertz=fhat*fs;
X = fftshift(fft(x));
figure(1);
semilogy(fHertz,X);
title('Magnitude of the DFT (Logarithmic)');

%Based on the graph, there is a distinct drop at +/- 150 kHZ, therefore the
%suggested bandwith for this signal should be f=150 kHz. And therefore, it
%was oversampled. fs = 44.1 kHz, but a sampling frequency of 2*1.5 kHz is
%all that is needed, i.e. 3 kHz sampling frequency

%c.)
%"Boost" the bass
fbass = 500; %Hz
fmax = fs/2;
frac=fbass/fmax;
N=length(x);

%"Boost" the bass of the positive frequencies
for i=1:2*(N*frac)
    x(i)=3*x(i);
end
%"Boost" the bass of the negative frequencies
for i=((2*N)-(N*frac)):N
    x(i)=3*x(i);
end

figure(2);
X = fftshift(fft(x));
semilogy(fHertz,X);
axis([-2.5e4 2.5e4 -100000 100000]);
title('Boosted DFT signal (Logarithmic)');

Xinverse = ifft(x);
% Plot
figure(3);
semilogy(fHertz,Xinverse);
axis([-2.5e4 2.5e4 -100000 100000]);
title('IFFT of boosted signal (Logarithmic)');

% The spectrum of the boosted signal has a greater magnitude than that of
% the orginal signal in the range of -500 Hz to 500 Hz.

%d.)
% Boost the base of the song freak.wav
xx=wavread('freak');
for i=1:2*(length(xx)*(fbass/fmax))
    for j=1:2
        xx(i,j)=3*xx(i,j);
    end
end
Xx = fftshift(fft(xx));
N=length(xx);
fhat=(-N/2:N/2-1)/N;
fHertz=fhat*fs;
figure(4);
semilogy(fHertz,Xx);
title('Spectrum of freak.wav (Logarithmic)');
%Reset x
x=xtemp;

