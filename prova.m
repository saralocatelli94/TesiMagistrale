addpath('C:\Users\sara\Downloads\pam_tompkin')

filename='apnea-ecg/a01'
f='a01'
[signal,Fs,tm]=rdsamp(filename);
[qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin(signal(1:1000),Fs,1)
%plot(qrs_i_raw,qrs_amp_raw)