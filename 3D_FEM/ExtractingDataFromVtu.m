
dir1='.\wire00000150.vtu'; %%Path to vtu file

text = fileread(dir1) ;
LF = text(22); %% Special character, ASCII 10, LF
splitted = split(text, ['<DataArray type="Float64" Name="ux" format="ascii">' LF]);
splitted_n = splitted(2);
temp = splitted_n{1,1};
splitted_new = split(temp,[LF '        </DataArray>']);
temp = splitted_new(1);
current_u = temp{1,1};
temp = split(current_u,[" "]);
temp = temp(1:end-1);
B = cellfun(@str2num, temp);

numpoint = size(B,1);
points_ux = reshape(B',[1,numpoint])';

splitted = split(text, ['<DataArray type="Float64" Name="uy" format="ascii">' LF]);
splitted_n = splitted(2);
temp = splitted_n{1,1};
splitted_new = split(temp,[LF '        </DataArray>']);
temp = splitted_new(1);
current_u = temp{1,1};
temp = split(current_u,[" "]);
temp = temp(1:end-1);
B = cellfun(@str2num, temp);

numpoint = size(B,1);
points_uy = reshape(B',[1,numpoint])';

splitted = split(text, ['<DataArray type="Float64" Name="uz" format="ascii">' LF]);
splitted_n = splitted(2);
temp = splitted_n{1,1};
splitted_new = split(temp,[LF '        </DataArray>']);
temp = splitted_new(1);
current_u = temp{1,1};
temp = split(current_u,[" "]);
temp = temp(1:end-1);
B = cellfun(@str2num, temp);

numpoint = size(B,1);
points_uz = reshape(B',[1,numpoint])';

splitted = split(text, ['<DataArray type="Float64" Name="Points" NumberOfComponents="3" format="ascii">' LF]);
splitted_n = splitted(2);
temp = splitted_n{1,1};
splitted_new = split(temp,[LF '        </DataArray>']);
temp = splitted_new(1);
current_u = temp{1,1};
temp = split(current_u,[" "]);
temp = temp(1:end-1);
B = cellfun(@str2num, temp);
numpoint = size(B,1)/3;
points_initial_coords = reshape(B',[3,numpoint])';

points_u = [points_ux points_uy points_uz];


splitted = split(text, ['<DataArray type="Float64" Name="etens" format="ascii">' LF]);
splitted_n = splitted(2);
temp = splitted_n{1,1};
splitted_new = split(temp,[LF '        </DataArray>']);
temp = splitted_new(1);
current_u = temp{1,1};
temp = split(current_u,[" "]);
temp = temp(1:end-1);
B = cellfun(@str2num, temp);
numcells = size(B,1);
e_tens = reshape(B',[1,numcells])';


splitted = split(text, ['<DataArray type="Int64" Name="connectivity" format="ascii">' LF]);
splitted_n = splitted(2);
temp = splitted_n{1,1};
splitted_new = split(temp,[LF '        </DataArray>']);
temp = splitted_new(1);
current_u = temp{1,1};
temp = split(current_u,[" "]);
temp = temp(1:end-1);
B = cellfun(@str2num, temp);
connection_first = B(1:2:end);
connection_second = B(2:2:end);
init_connection = 2*ones(size(connection_first));
connection_final=[init_connection,connection_first,connection_second];

splitted = split(text, ['<DataArray type="Float64" Name="d0" NumberOfComponents="3" format="ascii">' LF]);
splitted_n = splitted(2);
temp = splitted_n{1,1};
splitted_new = split(temp,[LF '        </DataArray>']);
temp = splitted_new(1);
current_u = temp{1,1};
temp = split(current_u,[" "]);
temp = temp(1:end-1);
B = cellfun(@str2num, temp);
numpoint = size(B,1)/3;
points_d0 = reshape(B',[3,numpoint])';
points_final = points_initial_coords+points_u;
clearvars -except points_u points_initial_coords points_final connection_final points_d0 e_tens
plot(points_final(:,1),points_final(:,2),'.') %% Plotting in 2D, it doesn't represent actual colony