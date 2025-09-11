function [t_vec, av_pos_inert, av_att, tar_pos_inert, tar_att] = LoadASPENData(filename)
    State = readmatrix(filename); % read in values
    State(1:3, :) = []; % get rid of first 3 rows (NaN values)

    t_vec = (State(:,1)-1) / 100; % time vector

    % obtaining position and euler angle vectors for N frame and Target
    % frame
    pos_av_aspen = State(:,12:14)';
    pos_av_aspen  = pos_av_aspen/1000; % Convert from mm to m
    att_av_aspen = State(:,9:11)';
    pos_tar_aspen = State(:,6:8)';
    pos_tar_aspen = pos_tar_aspen/1000;

    att_tar_aspen = State(:,3:5)';

    % Obtaining position and euler angle vectors for E frame
    [av_pos_inert, av_att, tar_pos_inert, tar_att] = ConvertASPENData(pos_av_aspen, att_av_aspen,  pos_tar_aspen, att_tar_aspen);


end