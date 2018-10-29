

signal='apnea-ecg/a01';
r_peaks='qrs';
data_type=1;
channel=2;
show=1;
y=edr(data_type,signal,r_peaks,[],[],[],channel,show);
wfdb2mat('a01')
[~,signal,Fs,~]=rdmat('a01m');
resp=signal(:,1);
resp=resp-mean(resp);
resp=resp*200;
sec=length(resp)/Fs;
xax=[.25:.25:sec];
r=interp1(y(:,1), y(:,2), xax, 'spline');
figure
plot(xax,r)
hold on
plot([1:length(resp)]/Fs,resp,'r')
legend('edr','respiratory signal')
xlabel('time (s)')
