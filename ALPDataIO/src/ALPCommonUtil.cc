#include "ALPDataIO/ALPCommonUtil.h"

std::string getLowerSuffix(const std::string& filename)
{
    std::string suffix;
    suffix = filename.substr(filename.find('.') + 1);
    return suffix;
}

std::vector<std::string> getSepedFileList(const std::string& filenames)
{
    std::vector<std::string> nameList;
    std::string names = filenames;
    size_t pos;
    while(true)
    {
        pos = names.find(',');
        std::string name = names.substr(0, pos);
        if (name.size()) 
        {
            // TODO trim
            name.erase(0,name.find_first_not_of(" "));
            name.erase(name.find_last_not_of(" ") + 1);
            nameList.push_back(name);
        }
        if (pos == names.npos || pos == names.size() - 1) 
        {
            break;
        }
        names = names.substr(pos + 1);
    }
    return nameList;
}
