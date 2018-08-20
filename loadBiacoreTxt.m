function curves = loadBiacoreTxt(fullPath)

delimiter = '\t';
t = readtable(fullPath, 'Delimiter',delimiter);

% Each curve has two columns of format '..._X' and '..._Y'.
% We assume that the table is sorted and has an even number of headings.
% Convert table to cell array
colNames = t.Properties.VariableNames;

curves = cell(length(colNames)/2,1);
for n = 2:2:length(colNames)
	thisName = colNames{n}(1:end-2);
	x =t.(colNames{n-1});
	y = t.(colNames{n});
	okVals = ~(isnan(x) | isnan(y));
	% strip any NaNs
	thisCurve.name = thisName;
	thisCurve.x = x(okVals);
	thisCurve.y = y(okVals);

	curves{n/2} = thisCurve;
end