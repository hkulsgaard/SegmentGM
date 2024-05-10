function path = get_path(id)
    switch id
        case "source"
            path = pwd;
            
        case "template"
            path = fullfile(spm('dir'),"tpm","labels_Neuromorphometrics.nii");
            
        case "maps"
            path = "maps";
        
        case "references"
            path = "references";
        
        case "cat12_dir"
            path = fullfile(spm('dir'),'toolbox','cat12');
            
        case "cat12_template"
            path = fullfile(spm('dir'),"tpm","TPM.nii");
            
        case "cat12_shooting"
            path = fullfile(get_path("cat12_dir"),"templates_1.50mm","Template_0_IXI555_MNI152_GS.nii");
       
        case "T1"
            path = fullfile(get_path("cat12_dir"),"templates_MNI152NLin2009cAsym","T1.nii");
            
        case "brainmask"
            path = fullfile(get_path("cat12_dir"),"templates_MNI152NLin2009cAsym","brainmask.nii");
            
        case "cat12atlas"
            path = fullfile(get_path("cat12_dir"),"templates_MNI152NLin2009cAsym","cat.nii");
            
        case "segments"
            path = "mri";
        
        case "prepro_module"
            path = fullfile("cat12_modules", "cat12_prepro_module.mat");
         
        case "7z"
            path = fullfile("7zip", "7za.exe");
        
        otherwise
            error("[ERROR]Unknown selected path")
    
    end
end

