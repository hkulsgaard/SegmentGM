clear;clc;tic;

source_path = get_path('source');

print_inic()

if ~isdeployed
    addpath('utils');
end

% Select niftis to segment
[nii_paths, ~] = select_files(source_path, '*.nii;*.nii.gz', "manual", "Select the nifti images to segment", 1);

% Check if niftis were preprocessed, if not, runs preprocessing step
prepro_check = check_prepro(nii_paths);

%[nii_paths, to_delete] = extract_niftis(nii_paths);

% ETA: 15~20min per nifti
if sum(prepro_check) ~= 0
    to_prepro = nii_paths(logical(prepro_check));
    cat_preprocess(to_prepro);
end

fprintf('[INFO]Elapsed time %.2f minutes\n[INFO]Job done!\n', double(toc/60));

% If there is decompressed files, delete it
%if not (all(to_delete==""))
%    delete_extracted_files(to_delete);
%end

function output = print_inic()
    c = fix(clock);
    fprintf('[INFO]Segment GM script loading [%i:%i - %i/%i/%i]\n', c(4),c(5), c(3),c(2),c(1));
end

function [nii_paths, to_delete] = extract_niftis(nii_paths)
    n_del = 1;
    to_delete = "";
    for p=1:size(nii_paths,1)
        [folder, file, ext] = fileparts(nii_paths(p));
        if strcmp(ext,'.gz')
            status = extract_file(nii_paths(p), false);
            if status
                new_p = fullfile(folder, file);
                %fprintf('[INFO]Nifti extracted: %s\n',new_p)
                nii_paths(p) = new_p;
                to_delete(n_del,1) = new_p;
                n_del = n_del + 1;
            end
        end
    end
end

function status = delete_extracted_files(to_delete)
    for p=1:size(to_delete,1)
        delete(to_delete(p))
    end
    
    status = 1;
end