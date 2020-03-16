#!/system/bin/sh
# 请不要硬编码 /magisk/modname/... ; 请使用 $MODDIR/...
# 这将使你的脚本更加兼容，即使Magisk在未来改变了它的挂载点
MODDIR=${0%/*}

# 这个脚本将以 post-fs-data 模式执行
# 更多信息请访问 Magisk 主题

# 调度器微调
echo "2000"> /sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us
echo "2000"> /sys/devices/system/cpu/cpufreq/policy0/schedutil/up_rate_limit_us
echo "2000"> /sys/devices/system/cpu/cpufreq/policy4/schedutil/down_rate_limit_us
echo "2000"> /sys/devices/system/cpu/cpufreq/policy4/schedutil/up_rate_limit_us

# EAS激进程度调整
echo "0"> /dev/stune/background/schedtune.boost
echo "0"> /dev/stune/background/schedtune.prefer_idle
echo "10"> /dev/stune/foreground/schedtune.boost
echo "1"> /dev/stune/foreground/schedtune.prefer_idle
echo "10"> /dev/stune/top-app/schedtune.boost
echo "1"> /dev/stune/top-app/schedtune.prefer_idle
echo "10"> /dev/stune/rt/schedtune.boost
echo "1"> /dev/stune/rt/schedtune.prefer_idle

# GPU最高和最低频率调整
echo "103750000"> /sys/devices/platform/e82c0000.mali/devfreq/gpufreq/min_freq
echo "767000000"> /sys/devices/platform/e82c0000.mali/devfreq/gpufreq/max_freq

# 设置权限
chmod 0444 /sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us
chmod 0444 /sys/devices/system/cpu/cpufreq/policy0/schedutil/up_rate_limit_us
chmod 0444 /sys/devices/system/cpu/cpufreq/policy4/schedutil/down_rate_limit_us
chmod 0444 /sys/devices/system/cpu/cpufreq/policy4/schedutil/up_rate_limit_us

chmod 0444 /dev/stune/background/schedtune.boost
chmod 0444 /dev/stune/background/schedtune.prefer_idle
chmod 0444 /dev/stune/foreground/schedtune.boost
chmod 0444 /dev/stune/foreground/schedtune.prefer_idle
chmod 0444 /dev/stune/top-app/schedtune.boost
chmod 0444 /dev/stune/top-app/schedtune.prefer_idle
chmod 0444 /dev/stune/rt/schedtune.boost
chmod 0444 /dev/stune/rt/schedtune.prefer_idle

chmod 0444 /sys/devices/platform/e82c0000.mali/devfreq/gpufreq/min_freq
chmod 0444 /sys/devices/platform/e82c0000.mali/devfreq/gpufreq/max_freq
