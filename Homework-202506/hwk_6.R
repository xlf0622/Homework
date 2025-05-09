# 加载包
library(dplyr)
library(RSQLite)     # SQLite 驱动

# 1. 创建空数据库
mydb <- src_sqlite("ecology_data.sqlite", create = TRUE)

# 2. 读取 CSV 并上传到数据库
env <- read.csv("data/env.csv")  
copy_to(mydb, env, temporary = FALSE)  # permanent 存储，强制将表保存为永久表

# 3. 从数据库读取数据
mydb <- src_sqlite("ecology_data.sqlite")
env_table <- tbl(mydb, "env")

# 查看数据
print(env_table)
