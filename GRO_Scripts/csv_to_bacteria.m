%%For exporting csv to matlab file, you should drag to csv file to matlab
%%and import it as a numeric matrix, also you should select the option,
%%replace nonimportable cells with NaN
%%For example in here G4 is exported version of G4.5R4.5_datas.csv

alldatas= G4;%%Here you should write name of the imported numeric matrix
firstcolumn = alldatas(:,1);
indexofnans = find(isnan(firstcolumn)==1);
indexofnans = [indexofnans ; (length(firstcolumn)+1)];
r = 0.5;
bacteria_colonies_cell = cell(1,1);
for i = 1 :(length(indexofnans)-1)
    bacteria = zeros(indexofnans(i+1)-indexofnans(i)-1,6);
    currentdatas = alldatas((indexofnans(i)+1):(indexofnans(i+1)-1),:);
    bacteria(:,1) = currentdatas(:,2);
    bacteria(:,2) = currentdatas(:,3);
    bacteria(:,4) = currentdatas(:,4);
    bacteria(:,3) = (currentdatas(:,5))/(pi*r*r);
    bacteria(:,6) = (currentdatas(:,7)>currentdatas(:,6))+1;
    bacteria(:,1) = bacteria(:,1)*1e-7;
    bacteria(:,2) = bacteria(:,2)*1e-7;
    bacteria(:,3) = (bacteria(:,3)-1)*1e-6;
    bacteria_colonies_cell{i}=bacteria;
end
visualizeColony(bacteria_colonies_cell{1},0.5e-6,"true");
set(gca, 'YDir', 'reverse');