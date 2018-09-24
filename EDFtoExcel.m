addpath('C:\Users\sara\Documents\5anno\TESI\Edf_ReadWrite')
[data,header] = lab_read_edf('C:\Users\sara\Documents\5anno\TESI\tracciati\TracciatiEDF\e639a3ec-ed60-4c68-80cd-4a14cbb81f74\Traces.edf');
C = strsplit(header.hdr.intro)
s=C(12)
dateInfo=strsplit(s{1},'.')
startingHour=str2num(dateInfo{3}(3:4))
startingMin=str2num(dateInfo{4})
startingSec=str2num(dateInfo{5}(1:2))
startingTimeSeconds=startingHour*3600+startingMin*60+startingSec
samplingFreq=header.samplingrate
duration=seconds(length(data)/samplingFreq)
secondi_fine_registrazione=startingTimeSeconds+length(data)/samplingFreq
seconds_in_a_day=24*3600
duration.Format = 'hh:mm:ss.SSS'
time = transpose(linspace(startingTimeSeconds,secondi_fine_registrazione,length(data)));
dataColumn=transpose(data);
mat=[time, dataColumn]
ds = mat2dataset(mat);
ds.Properties.VarNames = {'time','spO2'};
filename=strcat('C:\Users\sara\Documents\5anno\TESI\tracciati\ConversioneExcel\',C(2),C(3),'_',C(12),'.csv')
csvwrite(filename{1},mat)