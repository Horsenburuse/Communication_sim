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

SNR = 10;

EsN0 = SNR + 10*log10(UpsampleTimes);
EbN0 = EsN0 - 10*log10(I);
BERBaseBandTheory = berawgn(EbN0,'qam',M);


