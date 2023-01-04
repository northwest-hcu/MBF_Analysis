file_list = cell(3, 1);
file_list{1, 1} = 'test.txt';
file_list{2, 1} = 'test2.txt';
file_list{3, 1} = 'test3.txt';
test_threshold = 0.1;

% 越えていないときのテスト
selected_file_list = mbf_getInnerThreshold(file_list, test_threshold, 0, 0);
disp(selected_file_list);

% 上に越えているときのテスト
selected_file_list = mbf_getInnerThreshold(file_list, test_threshold, -1, 0);
disp(selected_file_list);

% 下に越えているときのテスト
selected_file_list = mbf_getInnerThreshold(file_list, test_threshold, 1, 0);
disp(selected_file_list);