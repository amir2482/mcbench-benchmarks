function [PAPR_db]=papr2(x)
% PAPR_db = PAPR [dB]
% AvgP_db = Average Power [dB]
% PeakP_db = Maximum Power [dB]
Nx=length(x);
xI=real(x);
xQ=imag(x);
Power=xI.*xI+xQ.*xQ;
AvgP=sum(Power)/Nx;
AvgP_db=10*log10(AvgP);
PeakP=max(Power);
PeakP_db=10*log10(PeakP);
PAPR_db=10*log10(PeakP/AvgP);