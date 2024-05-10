% Loads the cat preprocessing modules and runs it
% Requires CAT12 installed
% ETA:10~15 min per image

%PARAMETERS:
%paths -> array of string with the path of the original nifti image

function cat_preprocess(paths)
    fprintf('[INFO]Pre-processing images...\n');
       
    % load pre-configured module for preprocessing
    prepro_batch = load(get_path('prepro_module'));
    prepro_batch.matlabbatch{1,1}.spm.tools.cat.estwrite.data = cellstr(paths);
    prepro_batch.matlabbatch{1,1}.spm.tools.cat.estwrite.opts.tpm = ...
        cellstr(get_path('cat12_template'));
    
    prepro_batch.matlabbatch{1,1}.spm.tools.cat.estwrite.tpm = ...
        cellstr(get_path('cat12_template'));
    
    prepro_batch.matlabbatch{1,1}.spm.tools.cat.estwrite.extopts.registration.regmethod.shooting.shootingtpm = ...
        cellstr(get_path('cat12_shooting'));
    
    prepro_batch.matlabbatch{1,1}.spm.tools.cat.estwrite.extopts.T1 = ...
        cellstr(get_path('T1'));
    
    prepro_batch.matlabbatch{1,1}.spm.tools.cat.estwrite.extopts.brainmask = ...
        cellstr(get_path('brainmask'));
    
    prepro_batch.matlabbatch{1,1}.spm.tools.cat.estwrite.extopts.cat12atlas = ...
        cellstr(get_path('cat12atlas'));

    % run the batch using the CAT12 function 
    warning ('off','all');
    cat_run(prepro_batch.matlabbatch{1,1}.spm.tools.cat.estwrite);
    warning ('on','all');
    
    
    
    %compress the wp1 segments and deletes all the p0 images
    for p = 1:size(paths,1)
        [folder, file, ext] = fileparts(paths(p));
        output_dir = fullfile(folder, get_path('segments'));
        
        if strcmp(ext,".gz")
            p0_file = fullfile(output_dir, strcat("p0",file));
        else
            p0_file = fullfile(output_dir, strcat("p0",file,ext));
        end
        
        if exist(p0_file,'file')==2
            delete(p0_file);
        end
        
        fprintf('[INFO]Compressing images...\n');
        zip_status = compress_file(fullfile(output_dir, strcat("wp1",file,ext)),1);
        if zip_status == 0
            fprintf('[INFO]Files were not compressed: 7zip was not found\n');
        end
        
    end
end