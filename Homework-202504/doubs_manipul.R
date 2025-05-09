# 加载所需包
library(ade4)
library(dplyr)
library(ggplot2)

# 导入数据
data(doubs)

# ---------- 问题1的代码 ----------
# 处理环境数据并生成统计结果
processed_env <- doubs$env |>
  select(dfs, alt, oxy, pH) |>                 # 选取列（包含 pH）
  rename(distance = dfs, oxygen = oxy) |>       # 重命名列
  filter(alt > 200) |>                         # 筛选海拔大于200的行
  arrange(desc(alt)) |>                        # 按海拔降序排列
  mutate(oxygen_category = ifelse(oxygen > 90, "High", "Low")) |>  # 添加分类列
  group_by(oxygen_category) |>                 # 按分类分组
  summarise(
    mean_alt = mean(alt, na.rm = TRUE),        # 计算平均海拔
    mean_pH = mean(pH, na.rm = TRUE)           # 计算平均 pH
  )

# 打印结果
print(processed_env)

# ---------- 问题2的代码 ----------
# 利用ggplot2包，绘制x=alt与y=oxy之间的散点图
ggplot(data = doubs$env) +
  geom_point(mapping = aes(x = alt, y = oxy))  

# 在上述散点图中，将数据dfs距离调整颜色；添加颜色映射（根据 dfs 距离）
ggplot(data = doubs$env) +
  geom_point(mapping = aes(x = alt, y = oxy, color = dfs)) 

