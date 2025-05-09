# 定义函数，使用 for 循环检查每个值是否高于阈值
check_threshold_for <- function(vec, threshold = 35) {
  result <- logical(length(vec))  # 创建一个逻辑向量
  for (i in seq_along(vec)) {
    result[i] <- vec[i] > threshold  # 检查是否高于阈值
  }
  return(result)
}

# 定义函数，使用 sapply() 进行向量化检查
check_threshold_apply <- function(vec, threshold = 35) {
  return(sapply(vec, function(x) x > threshold))  # 逐个检查
}

# 生成随机向量
set.seed(123)  # 设置随机种子以保证结果可复现
random_vec <- rnorm(n = 10, mean = 35, sd = 10)

# 使用 for 循环方法
result_for <- check_threshold_for(random_vec)
print(result_for)

# 使用 apply() 家族方法
result_apply <- check_threshold_apply(random_vec)
print(result_apply)