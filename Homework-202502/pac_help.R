# 查找tidyverse包是否已安装
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  # 如果没有安装，则安装tidyverse包
  install.packages("tidyverse")
}

# 加载tidyverse包
library(tidyverse)

# 查看已安装的tidyverse包的版本
packageVersion("tidyverse")