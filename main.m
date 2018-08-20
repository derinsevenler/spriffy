function main()
	% 
	% 1. Load SPR data
	
	% Biacore exports data in a tab-separated .txt.
	filterSpec = '*.txt';
	dialogTitle = 'Select the SPR data text file';
	[fname, dirname, filterIndex] = uigetfile(filterSpec, dialogTitle);
	
	curves = loadBiacoreTxt([dirname filesep fname]);


	% 2. Select curves for analysis
	figure; hold on;
	for n = 1:length(curves)
		plot(curves{n}.x/60,curves{n}.y);
	end
	xlabel('Time, minutes','FontSize',16);
	ylabel('RU','FontSize',16);
	set(gca,'FontSize',16);