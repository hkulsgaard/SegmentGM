function output = decompress_file(cpath, del_file)
    output = 0;
    zip_path = get_path('7z');
    if exist(zip_path, 'file')
        [folder, file, ext] = fileparts(cpath);
        command = strcat(zip_path, ' x "', cpath, '" -o"', folder,'"');
        [status,~] = system(command);

        if del_file && exist(new_path,'file')
            delete(cpath);
        end
        output = 1;
    end
end