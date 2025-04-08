# 加载所需包
library(ade4)         # 提供 doubs 数据集
library(vegan)        # 计算 Shannon 多样性指数
library(caret)        # 机器学习建模
library(randomForest) # 随机森林算法

# --------------------------
# 1) 处理 doubs 数据：计算 Shannon 指数并新增 mpg 列
# --------------------------
data(doubs)
fish_data <- doubs$fish

# 计算每个样地的 Shannon 多样性指数
shannon_index <- diversity(fish_data, index = "shannon")

# 新增 mpg 列（存储 Shannon 指数）
fish_data$mpg <- shannon_index

# 查看更新后的数据
head(fish_data)      # 确认新增的 shannon_index 列存在

# 更新 doubs 数据集（可选）
doubs$fish <- fish_data

# --------------------------
# 拆分数据集（假设以 mpg 为目标变量）
# --------------------------
set.seed(123)
train_index <- createDataPartition(fish_data$mpg, p = 0.8, list = FALSE)
training_data <- fish_data[train_index, ]
testing_data <- fish_data[-train_index, ]

# --------------------------
# 2) 训练随机森林模型
# --------------------------
model_rf <- train(mpg ~ ., data = training_data, method = "rf")  

# --------------------------
# 3) 添加 10-fold 重复交叉验证
# --------------------------
fitControl <- trainControl(
  method = "repeatedcv",  
  number = 10,            # 10 折交叉验证
  repeats = 5             # 重复 5 次
)

model_rf <- train(
  mpg ~ ., 
  data = training_data, 
  method = "rf",          
  trControl = fitControl
)

# --------------------------
# 4) 增加预处理（标准化和中心化）
# --------------------------
model_rf <- train(
  mpg ~ ., 
  data = training_data, 
  method = "rf",        
  preProcess = c('scale', 'center'),  # 标准化和中心化
  trControl = fitControl
)

# --------------------------
# 5) 参数调优（mtry）
# --------------------------
grid <- expand.grid(.mtry = c(1:10))  # 定义调优网格

model_rf <- train(
  mpg ~ ., 
  data = training_data, 
  method = "rf",        
  preProcess = c('scale', 'center'),
  trControl = fitControl,
  tuneGrid = grid        
)

# 查看最终模型结果
print(model_rf)
