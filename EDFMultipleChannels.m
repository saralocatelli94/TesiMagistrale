addpath('C:\Users\sara\Documents\5anno\TESI\EDFMatlabFunctions\blockEDFLoad');
[header, signalHeader, signalCell] = blockEdfLoad('C:\Users\sara\Documents\5anno\TESI\tracciati\Activity&spO2\e639a3ec-ed60-4c68-80cd-4a14cbb81f74\Traces.edf');
s=strsplit(header.recording_starttime,'.');
h=str2num(s{1});
m=str2num(s{2});
s=str2num(s{3});
startingTime_s=h*3600+m*60+s;
for i=1:length(signalHeader)
    a=signalHeader.samples_in_record;
    b=header.data_record_duration;
    samplingRate=a/b;
    duration=length(signalCell{i})/samplingRate;
    secondi_fine_registrazione=(startingTime_s+duration);
    time = transpose(linspace(startingTime_s,secondi_fine_registrazione,length(signalCell{i})));
    data=signalCell{i};
    mat=[time,data];
    ds = mat2dataset(mat);
    destdirectory = strcat('C:\Users\sara\Documents\5anno\TESI\tracciati\ConversioneExcel\',header.patient_id,header.recording_startdate);
    if ~exist(destdirectory, 'dir')
         mkdir(destdirectory);
    end
    filename=strcat(destdirectory,'\',signalHeader(i).signal_labels,'.csv');
    csvwrite(filename,mat)
end