# 执行日报 2026-11-26
<!-- store-promotion-daily:2026-11-26 -->

## 一、区间、逻辑截止与证据覆盖

- 报告区间（起点含、终点不含）：**2026-11-25T02:00:00Z 至 2026-11-26T02:00:00Z**，即北京时间 11 月 25 日 10:00 至 11 月 26 日 10:00。
- 上一份成功日报截止：2026-11-25T02:00:00Z；本次逻辑截止固定为 2026-11-26T02:00:00Z。
- 本轮实际开始核验：2026-11-26T02:00:59Z；最新只读 Verify job 于 2026-11-26T02:03:33Z 完成，较逻辑截止晚 **213 秒**。
- **发布历史数据时间：2026-11-26T01:00:15.248346Z**（Issue #2 云端快照 comment 7179329080）。该快照距逻辑截止尚差 **59 分 44.751654 秒**，其后至 02:00Z 没有可用的完整 Pin history 查询结果。因此下文逐账号数量均为截至该快照的**已确认下限**；最终完整区间数标为**未确认**，不能把快照内的 0 写成完整区间 0。
- 仓库访问已由 GitHub 连接器确认。写入前 main HEAD 为 8d6a88efcaaa62909df005b0011e4cc134a28cf；日报状态文件写入前 SHA 为 2227532fe5b14d98fac84dce1ddfb3ca40c2afb9。
- 已读取 Issue #2 的全部 **190** 条既有评论；当日标记此前不存在，上一份日报评论为 [comment 7150314865](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-7150314865)。按标题搜索发布复核 Issue，仅找到 [Issue #3：Pinterest 2026-10-23 21:35 发布复核](https://github.com/Sailin09/Store-Promotion/issues/3)，无评论、无更新的当期复核 Issue。
- 区间内 replenishment 证据目录有 4 份 cloud-run：  
  [05:16:09Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261125-051609.json)（Verify attempt 13 / job 138996233861）、[11:12:34Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261125-111234.json)（attempt 14 / job 139163820935）、[17:19:53Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261125-171953.json)（attempt 15 / job 139379512151）、[23:21:01Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261125-232101.json)（attempt 16 / job 139577759283）。四次均未形成新 batch。
- 区间没有新增 batch 文件；最新 batch 仍为 11 月 22 日的 batch-20261122-051903.json。区间也没有新增 verification-*.json 文件。11 月 26 日 01:00Z 的云端发布快照保存在 Issue #2 评论及其 workflow/job 日志中，而非新的 cloud-run JSON 文件。
- 最新 Verify Supabase Data 的只读重跑是 **run 45016861552 / attempt 17 / job 139641833007**，于 02:03:19Z–02:03:33Z 执行成功。它保留原 push 事件，因此 Pinterest queue 检查和 scheduler/publication health 两步被 workflow 条件跳过；不能把该 job 的 success 当成完整发布健康核验。

## 二、Pinterest 实际发布

发布明细来自 Issue #2 的 01:00:15.248346Z 快照。当前 main 的 scripts/cloud-publication-report.sql 对 baseline 之后的全部 published history 聚合 Pins，没有 LIMIT；以下只筛选本日报区间内且在快照时间之前的真实 published_at，并按 Pin ID 去重。

| 账号 | 快照内已确认新增 | 最终区间数量 | 说明 |
|---|---:|---|---|
| P1 / icyndizhang | **3** | 未确认 | 已确认 3 条，快照后仍有覆盖缺口 |
| P2 / sailing_981 | **3** | 未确认 | 已确认 3 条，快照后仍有覆盖缺口 |
| P3 / mydecorshop | **0** | 未确认 | 快照截至时间未发现区间新 Pin，不等于完整区间为 0 |
| P4 / cindyzhang62 | **0** | 未确认 | 快照截至时间未发现区间新 Pin，不等于完整区间为 0 |
| P5 / ivy5205 | **1** | 未确认 | 已确认 1 条，快照后仍有覆盖缺口 |
| **合计** | **7** | **未确认** | 7 条为真实可核实下限，不是完整区间总数 |

### 已确认 Pin 明细

| 账号 | 店铺 | Etsy 商品 ID / 链接 | Pinterest Pin | published_at（UTC） |
|---|---|---|---|---|
| P1 / icyndizhang | Parkermo | 1856989877 · [Etsy listing](https://www.etsy.com/listing/1856989877) | [801218590010009430](https://www.pinterest.com/pin/801218590010009430/) | 2026-11-25T02:05:02.631448Z |
| P1 / icyndizhang | ShirieHomeShow | 1887210061 · [Etsy listing](https://www.etsy.com/listing/1887210061) | [801218590010015996](https://www.pinterest.com/pin/801218590010015996/) | 2026-11-25T13:00:03.934811Z |
| P1 / icyndizhang | SobiaStudio | 4449121553 · [Etsy listing](https://www.etsy.com/listing/4449121553) | [801218590010025624](https://www.pinterest.com/pin/801218590010025624/) | 2026-11-26T00:00:03.956793Z |
| P2 / sailing_981 | LambertHouse | 4359115799 · [Etsy listing](https://www.etsy.com/listing/4359115799) | [863494928599771107](https://www.pinterest.com/pin/863494928599771107/) | 2026-11-25T02:10:02.529511Z |
| P2 / sailing_981 | Adamideal | 4539284822 · [Etsy listing](https://www.etsy.com/listing/4539284822) | [863494928599777376](https://www.pinterest.com/pin/863494928599777376/) | 2026-11-25T13:05:03.014475Z |
| P2 / sailing_981 | KoltCraftStudio | 1883988142 · [Etsy listing](https://www.etsy.com/listing/1883988142) | [863494928599784874](https://www.pinterest.com/pin/863494928599784874/) | 2026-11-26T00:05:02.275220Z |
| P5 / ivy5205 | NngGoods | 4537650021 · [Etsy listing](https://www.etsy.com/listing/4537650021) | [713820609738149745](https://www.pinterest.com/pin/713820609738149745/) | 2026-11-25T02:55:03.152521Z |

### 未发布、失败与待处理

以下待发布数来自 01:00:15Z 云端快照，是该时点 ready/scheduled 队列状态，不是本区间发布数：

- P1：42 条待发布。
- P2：2 条待发布。
- P3：6 条待发布；另有 1 条历史未决发布尝试。
- P4：0 条待发布。
- P5：0 条待发布。

P3 / mydecorshop 未决记录：queue_id **35c31472-0b55-4f6d-bd70-eb336463ee80**，attempt_id **c6bd08a5-afc4-495c-a309-8482d88efefb**，状态 **uncertain**，错误 **pin_response_503**，started_at 为 2026-11-13T13:15:03.013284Z；没有可核实的 Pin ID 或 publish_history。它不是本区间新产生的 Pin 失败，不能计为成功。区间内 Cloud promotion operations [run 45715350096 / job 139560070144](https://github.com/Sailin09/Store-Promotion/actions/runs/45715350096) 在 Verify cloud stock and publication evidence 步骤失败，诊断指向这条仍未解决的 uncertain 记录。保护性发布检查返回 idle / outside_publish_window，published=0；没有重试该记录、清除去重记录或重置历史。

最新 Pinterest Publisher workflow [run 45722910465 / job 139585399307](https://github.com/Sailin09/Store-Promotion/actions/runs/45722910465) 的 workflow/job 结论为 success，但实际日志是 idle / outside_publish_window，published=0。这只说明该次 Publisher job 没有发布，不代表本区间没有其他 Pin。最新 Cloud promotion operations [run 45732618983 / job 139618284569](https://github.com/Sailin09/Store-Promotion/actions/runs/45732618983) 于 01:00Z 成功生成 stock 快照，返回 deficit=46；这是报告任务成功，不是发布成功。Verify attempt 17 的 queue/scheduler 步骤被跳过，因此 01:00:15Z 之后的最终发布健康状态仍未确认。

## 三、区间新增补货素材、未入库候选与幂等证据

**本区间已确认新增 batch：0；新增入库素材：0；新增 queue_id：0。**

这里的 0 表示没有本区间 batch/入库记录，不代表执行过入库并得到 inserted=0：本区间没有创建 batch，没有触发 Replenish verified stock，first inserted、failed、幂等 retry 均为**未执行 / 不适用**。因此不能把本区间描述为“幂等验证成功”。

四次 cloud-run 均因远程浏览器能力阻塞而未完成 Etsy 发现：当前运行没有远程 cloud CDP 导航、点击和截图接口；Browser.list_tabs 曾返回 originating browser context 阻断，后续记录明确只有只读 list_tabs/get_tab_context。没有访问 storefront、商品详情、卖家归属、在售选项或 Add to cart，也没有查看原始主图截图。可访问范围内候选发现 0 条、实际视觉核验 0 条；**全部候选总量未评估，不是 0 个候选**。本区间没有可列出的真实新增素材，也没有新增重复入库或入库失败记录。

### 区间外最近一次真实入库（只作幂等证据，不计入本日报）

最新历史批次为 [batch-20261122-051903.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261122-051903.json)，对应 [Replenish verified stock run 44988950045 / job 137105705490](https://github.com/Sailin09/Store-Promotion/actions/runs/44988950045)。它发生在本日报区间之前。5 条素材均真实 inserted=1、skipped_existing=0；实际队列均为 ready 且 snapshot_matches=true：

| Shop | Etsy listing | Account / handle | Board ID | queue_id | 入库与视觉核验 |
|---|---|---|---|---|---|
| FrenchStyleDecor | [1884132251](https://www.etsy.com/listing/1884132251/embroidered-white-cotton-apron-with-lace) | P1 / icyndizhang | 801218658646993070 | a00b7693-de90-4ed9-9965-59db15dd2c0b | ready / true；发现 05:16:07.444Z；原图截图在 05:16–05:19Z 实际查看；checked_at 05:19:03.666Z；inserted 05:20:54.8745939Z |
| KoltCraftStudio | [1883988142](https://www.etsy.com/listing/1883988142/camphor-wooden-coat-hangers-natural-wood) | P2 / sailing_981 | 863494997243989843 | 77ed2a8d-5b5a-4e97-9b43-7d0406ff3bca | ready / true；发现 05:16:21.746Z；原图截图在 05:16–05:19Z 实际查看；checked_at 05:19:03.750Z；inserted 05:21:00.5573935Z |
| KorusStore | [4405714144](https://www.etsy.com/listing/4405714144/olive-green-chenille-curtains-rustic) | P1 / icyndizhang | 801218658646993070 | 7da400e0-ef80-4299-ad4c-e5df3b5e9d4c | ready / true；发现 05:16:31.400Z；原图截图在 05:16–05:19Z 实际查看；checked_at 05:19:03.808Z；inserted 05:21:01.0388830Z |
| LambertHouse | [4314290016](https://www.etsy.com/listing/4314290016/aluminum-alloy-clothes-hangers-heavy) | P2 / sailing_981 | 863494997243989843 | 1197e897-2e8b-4717-a861-6dd4323fbcb5 | ready / true；发现 05:16:54.552Z；原图截图在 05:16–05:19Z 实际查看；checked_at 05:19:03.842Z；inserted 05:21:01.6401701Z |
| NngGoods | [4537650021](https://www.etsy.com/listing/4537650021/clear-quartz-cabinet-knob-crystal-drawer) | P5 / ivy5205 | 713820678377803412 | 9ba68eb6-f9f9-4154-ba9d-ad4dc3f01915 | ready / true；发现 05:18:01.768Z；原图截图在 05:16–05:19Z 实际查看；checked_at 05:19:03.893Z；inserted 05:21:02.8431367Z |

该历史 run 的首轮结果为 **inserted=5、failed=0、pending=5**；同一 job 的 Verify idempotent retry 步骤于 2026-11-22T05:21:03.2714372Z 返回 status=no_new_verified_material、**inserted=0**。这是 11 月 22 日批次的真实幂等证据，明确属于区间外；本日报不把它计入本区间新增。

## 四、当前素材库存与各路线缺口

以下是**截止后当前核验时点值**，不是本区间新增量。来源为 Verify Supabase Data run 45016861552 / attempt 17 / job 139641833007，replenishment_plan 数据时间 **2026-11-26T02:03:31.6507856Z**。当前 main 的 scripts/replenishment-plan.sql SHA 为 f2cdd7c4af1661683fe79da2f06617b438d29299，32 条路线的 target 均为 **3**：

- 有效店铺/账号路线：32；总目标：96。
- 当前可用：**50**；总缺口：**46**。
- 库存 0：10 条路线，缺口 30。
- 库存 1：6 条路线，缺口 12。
- 库存 2：4 条路线，缺口 4。
- 库存 3：12 条路线，缺口 0。

| 店铺路线 | Account / handle | Board ID | usable / target | deficit |
|---|---|---|---:|---:|
| Adamideal | P2 / sailing_981 | 863494997243989843 | 0 / 3 | 3 |
| ChicDecorHK | P4 / cindyzhang62 | 675399344058025061 | 0 / 3 | 3 |
| Chtte | P3 / mydecorshop | 499618221101215211 | 0 / 3 | 3 |
| HibiChStudio | P2 / sailing_981 | 863494997243989843 | 0 / 3 | 3 |
| KoltCraftStudio | P2 / sailing_981 | 863494997243989843 | 0 / 3 | 3 |
| MiawoodStudio | P2 / sailing_981 | 863494997243989843 | 0 / 3 | 3 |
| NinaJiaStudio | P5 / ivy5205 | 713820678377803445 | 0 / 3 | 3 |
| NngGoods | P5 / ivy5205 | 713820678377803412 | 0 / 3 | 3 |
| PearlsTreasuresArt | P4 / cindyzhang62 | 675399344058025061 | 0 / 3 | 3 |
| QuGifts | P4 / cindyzhang62 | 675399344056772225 | 0 / 3 | 3 |
| LambertHouse | P2 / sailing_981 | 863494997243989843 | 1 / 3 | 2 |
| MiraKiuStudio | P1 / icyndizhang | 801218658646993070 | 1 / 3 | 2 |
| Parkermo | P1 / icyndizhang | 801218658646993070 | 1 / 3 | 2 |
| ShirieHomeShow | P1 / icyndizhang | 801218658646993070 | 1 / 3 | 2 |
| SobiaStudio | P1 / icyndizhang | 801218658646993070 | 1 / 3 | 2 |
| WoodHomeLiang | P2 / sailing_981 | 863494997243989843 | 1 / 3 | 2 |
| Chtte | P1 / icyndizhang | 801218658646993070 | 2 / 3 | 1 |
| GavinHome | P1 / icyndizhang | 801218658646993070 | 2 / 3 | 1 |
| HeyDream | P1 / icyndizhang | 801218658646993070 | 2 / 3 | 1 |
| KorusStore | P1 / icyndizhang | 801218658646993070 | 2 / 3 | 1 |
| AmyHomeCrafts | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| beou | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| CellaHo | P3 / mydecorshop | 499618221101238533 | 3 / 3 | 0 |
| ChicDecorHK | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| CustomCurtainsStudio | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| DanyHomeDesign | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| FrenchStyleDecor | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| LoomGoStudio | P3 / mydecorshop | 499618221101238533 | 3 / 3 | 0 |
| NiceCraftStudioHK | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| StellaGoodsGifts | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| TunaMunStudio | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| WOGOL | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| **合计** | **32 条路线** | — | **50 / 96** | **46** |

同一 Verify job 的数据库基础计数：30 shops、30 classified、584 products、584 Pinterest variants、584 Facebook variants、246 draft_queue、32 active mappings、5 Pinterest accounts、584 Pinterest routed queue。

**口径差异仍未修复：** 当前 scripts/replenishment-plan.sql 和 operations/replenishment/README.md 明确使用 target=3，最新 Verify 的 32 条 replenishment_plan 也全部输出 target=3；但 operations/cloud-operations.md 的历史说明以及 01:00Z Issue #2 库存快照文案仍写“7 条目标”。该快照的总目标数学关系为 32×3=96，usable 50、deficit 46，且逐路线待补值也与 target=3 一致。本日报按用户确认和当前 SQL 使用 target=3，并将“7 条”文案视为未解决的过期口径，不据此改写库存数字。

## 五、首次缺口跟进、自动化与未解决事项

- 首次缺口跟进文件 [first-deficit-followup.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json) 状态仍为 **completed**，完成时间 2026-10-23T13:52:56.578Z；首次真实入库 2 条、真实 retry inserted=0、当时 remaining_deficit=0。该一次性跟进不重复执行，长期按缺口补货保持独立。
- Etsy 云端持续补货 automation **6adb18502ca08191b0b05f436915aee4** 已通过 Automations 读取确认为 enabled；最近一次 11 月 25 日 23:15Z 计划运行于 23:19:26Z 开始、23:23:31Z 完成；下一次计划 2026-11-26T05:15:00Z。没有修改其 prompt、排程或启停状态。
- Supabase Pinterest 发布调度在 01:00:15Z 快照中显示 enabled、cron 为 */5 * * * *。快照列出的最新请求 01:00:00Z 仍为 pending，00:55Z 至 00:15Z 的若干请求为 idle；HTTP 200 / idle 不代表发布成功。由于 Verify attempt 17 的 scheduler 检查被 push 条件跳过，02:00Z 截止时的最终调度健康状态未重新确认。
- 本轮没有执行修复、重试、入队、补货、发布或历史重置。新增未解决事项为：P3 的 pin_response_503 uncertain 记录、远程 cloud CDP 页面控制/截图能力缺失、cloud-operations 的 target=7 过期文案。Cloud promotion operations run 45715350096 的失败原因已定位为该 P3 uncertain 记录触发健康门槛，但记录本身仍未解决。
- 本次全程纯云端只读执行：仅使用 GitHub 与 Automations 连接器；没有使用用户电脑、桌面浏览器会话、本地路径、Codex 进程或 heartbeat；没有要求配置 OpenAI/Etsy API key。没有创建本地任务，没有触碰用户本地日报 ID10。

## 六、报告文件与投递

- 完整 Markdown：[daily-report-2026-11-26.md](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-26.md)。
- 配套机器可读证据：[daily-report-2026-11-26.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-26.json)。
- 日报投递目标：[GitHub Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2)。本条评论使用唯一标记，后续同日重跑应更新此条，不重复新增。
- 只在 Issue #2 评论成功、完整 Markdown/JSON 保存并回读后，才推进 cloud-daily-report-state.json 的成功截止与 comment_id。发布、补货、队列、历史记录、首次跟进状态及既有修复安排均保持原样。
