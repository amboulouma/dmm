FigList = findobj (allchild (0), 'flat' , 'Type' , 'figure' );
for iFig = 1: length (FigList)
    FigHandle = FigList (iFig);
    filename = strcat('fig_', num2str(iFig));
    filename = strcat(filename, '.png');
    saveas(FigHandle,filename);
end