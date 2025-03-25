#Exercise 1
# 创建三个向量x、y、z
x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c(7, 8, 9)

# 将三个向量合并成一个3×3的矩阵A，每一列代表一个向量
A <- cbind(x, y, z)

# 设置行名为a、b、c
rownames(A) <- c("a", "b", "c")

# 打印矩阵A
print(A)

# 创建三个向量x、y、z
x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c(7, 8, 9)

# 将三个向量合并成一个3×3的矩阵A，每一行代表一个向量
A <- rbind(x, y, z)

# 设置行名为a、b、c（这里假设行名仍然需要设置为a、b、c，但通常rbind会自动使用向量名作为行名）
rownames(A) <- c("a", "b", "c")

# 打印矩阵A
print(A)

#Exercise 2
# 安装并加载包（若未安装）
install.packages("ade4")
library(ade4)

# 导入doubs数据集
data(doubs)

# 查看doubs数据
class(doubs)  # 查看类型
str(doubs)    # 查看结构

# 将doubs数据集保存到本地
# 保存为R数据文件
save(doubs, file = "doubs_data.RData")

# 保存为 CSV（例如环境数据部分）
write.csv(doubs$env, "doubs_env.csv")
