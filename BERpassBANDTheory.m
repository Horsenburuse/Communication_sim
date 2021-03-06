close all;
clc;
clear all;

BitRate = 4e6;
M =16;
I = log2(M);
SymbolRate = BitRate/I;
UpsampleTimes = 8;
SampleRate = SymbolRate * UpsampleTimes;
Fc = 2.5e6;
Fs = SampleRate;
SamplePerFrame = 4000;
SymbolPerFrame = SamplePerFrame/I;

for i = 1:1:30
    SNR(i) = i-20;
    EsN0(i) = SNR(i) + 10*log10(UpsampleTimes);
    EbN0(i) = EsN0(i) - 10*log10(I);
    BER(i) = berawgn(EbN0(i),'qam',M);
end
figure(1)
semilogy(SNR,BER,"bv-")
