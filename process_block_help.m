% Use this m file to generate the help.zip file for the product.

function process_block_help(NameValueArgs)

arguments
    NameValueArgs.force_update (1,1) {mustBeNumericOrLogical} = false;
    NameValueArgs.create_shipping_package (1,1) {mustBeNumericOrLogical} = false; 
end




force_update = NameValueArgs.force_update;
create_shipping_package = NameValueArgs.create_shipping_package;

setenv('LD_PRELOAD',"");

shipping_file_folder = 'shipping_folder';
categories = ["AIE", "HDL", "HLS", "UTIL", "GEN"];

if exist(categories(1), 'dir')
   if create_shipping_package
       mkdir(shipping_file_folder);
       mkdir(fullfile(shipping_file_folder,'html'));
   end
else
   error("You should run this script from the folder where the folders HLD, HLS, AIE, UTIL, and GEN are.");
end


[filepath,~,~] = fileparts(mfilename('fullpath'));

for c=1:length(categories)
    blocks = dir(categories(c));
    blocks=blocks(~ismember({blocks.name},{'.','..'}));

    cd(categories(c));

    for b=1:length(blocks)
        cd(blocks(b).name);

        html_file = categories(c)+"_"+blocks(b).name+".html";

        filelist = dir(fullfile('.','**'));
        filelist = filelist(~[filelist.isdir]);
        [~, index]   = max([filelist.datenum]);
        youngestFile = dir(filelist(index).name);

        d = dir;
%         root = d(ismember({d.name},{'.'}));
        traget_html_file = d(ismember({d.name},html_file));

        if ~isfile('README.md')
            disp(strcat("For directory ", blocks(b).name, " a README.md file does not exist. Skipping md to html conversion."));
        elseif force_update || isempty(traget_html_file) || datetime(traget_html_file.date) < datetime(youngestFile.date)

            %% Get the name of the help from the .md file.
            fid = fopen('README.md');
            line = fgetl(fid);
            bname = regexp(line,'#\s+(.*)','tokens');
            bname = bname{1}{1};
            fclose(fid);

            %% Repalce any link to another help with proper matlab funciton
            text = fileread('README.md');
            [first, last] = regexp(text,"(..\/..\/(GEN|HDL|AIE|HLS|UTIL)\/(.)*?\/README.md)");

            while ~isempty(first)
                string = text(first(1):last(1));
                id = regexp(string,".*(GEN|HDL|AIE|HLS|UTIL)\/(.*)\/README\.md",'tokens');
                text = replaceBetween(text,first(1),last(1),"matlab:helpview(vmcHelp('name','"+id{1}{2}+"','category','"+id{1}{1}+"'))");
                [first, last] = regexp(text,"(..\/..\/(GEN|HDL|AIE|HLS|UTIL)\/(.)*?\/README.md)");
            end

            writelines(text,'temp.md');

            %% Convert md to html
            pandoc_cmd = strcat("/usr/local/bin/pandoc --from gfm --to html -s --embed-resources --no-highlight -c ./xmc-matlab.css --section-divs --metadata title=""",bname,""" temp.md ", ' -o', html_file);
            system(pandoc_cmd);
            disp(html_file + " got generated.");
            delete temp.md
            
        end

        if create_shipping_package
            copyfile(html_file, fullfile('..','..',shipping_file_folder,'html'));
        end

        cd("..")

    end
    cd("..")
end

if create_shipping_package

    delete block_help.zip;

    copyfile(fullfile(filepath,"block_help_related_files","info.xml"), shipping_file_folder);
    copyfile(fullfile(filepath,"block_help_related_files","helptoc.xml"), fullfile(shipping_file_folder,'html'));


    cd(shipping_file_folder)

    system("zip -r ../help.zip .")

    cd('..');

    rmdir(fullfile('.',shipping_file_folder),'s');

    disp("Copy the help.zip file to the source code under doc/help.")

end

end
