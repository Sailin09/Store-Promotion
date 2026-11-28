# 执行日报 2026-11-28
<!-- store-promotion-daily:2026-11-28 -->

## 一、区间、逻辑截止与证据覆盖

- 仓库：[Sailin09/Store-Promotion](https://github.com/Sailin09/Store-Promotion)。
- 上一份成功日报：2026-11-27，Issue #2 评论 [7207882139](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-7207882139)；state 中记录的上一成功截止为 **2026-11-27T02:00:00Z**。
- 本次逻辑区间（起点含、终点不含）：**2026-11-27T02:00:00Z 至 2026-11-28T02:00:00Z**，即北京时间 **11 月 27 日 10:00 至 11 月 28 日 10:00**。
- 本次逻辑截止固定为 **2026-11-28T02:00:00Z**。实际只读 Verify job 于 **2026-11-28T02:02:34Z 开始、02:02:46Z 完成**（北京时间 10:02:34–10:02:46），较逻辑截止延迟 **166 秒**。
- 最新 SQL 计数与 32 条 replenishment_plan 输出日志时间为 **2026-11-28T02:02:44.8382027Z**（北京时间 10:02:44.838）；这是 job 日志中的查询输出时间，SQL 未提供数据库内部 snapshot timestamp。
- 发布历史最新可核实数据时间为 **2026-11-28T00:33:07.467166Z**（北京时间 08:33:07.467），来自 Issue #2 云端快照评论 [7231004966](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-7231004966)，并由后续核对评论 [7232108658](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-7232108658)复核。距逻辑截止尚有 **1 小时 26 分 52.533 秒**没有新的完整 Pin history 数据；因此本日报的 Pin 数量是截至 08:33:07 的已确认下限，完整区间最终总数标为**未确认**。
- 计数只按唯一 Pin ID 与真实 published_at 过滤；未使用历史累计 62 条作为每日基线。11 月 27 日完整自然日核对为 P1 3 条、P3 1 条，但其中 P1 08:00:03 的 Pin 早于本区间 10:00 起点，已排除；11 月 28 日截至 08:33:07 又确认 P1、P3 各 1 条。两日去重后，本区间确认 5 个唯一 Pin。
- 已读取 state、最新 main 的 replenishment 证据目录、operations/cloud-operations.md、Issue #2 全部 **203** 条评论、按标题搜索到的发布复核 Issue，以及发布/补货/Verify 工作流与实际 job 日志。Issue #2 当日 marker 此前不存在；上一日报 marker 为 2026-11-27。
- 发布复核 Issue：[Pinterest 2026-10-23 21:35 发布复核](https://github.com/Sailin09/Store-Promotion/issues/3)，当前 open、无评论；没有另一个当期复核 Issue。
- 写入前 main HEAD：3e4e8b02bfc207c066086e17042f73cff7d97c9d。区间内 replenishment 证据有四份 cloud-run： [05:14:45Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261127-051445.json)、[11:11:50Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261127-111150.json)、[17:20:51Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261127-172051.json)、[23:13:26Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261127-231326.json)。没有 11 月 27–28 日的新 batch 文件。
- 最新 Verify 为 run [45016861552](https://github.com/Sailin09/Store-Promotion/actions/runs/45016861552) attempt **27** / job **140827609528**，success。checkout SHA 为 08bd574e693260093ec58af508fbad2ecba2bb03；其中 replenishment-plan.sql blob SHA f2cdd7c4af1661683fe79da2f06617b438d29299、verify-supabase.yml blob SHA 7f7ab3498aa641784b10bbafa53fa8e8635bbd78，与本次最新 main 上的对应文件一致。由于该次 job 属于 push 事件，Pinterest queue 检查及 scheduler/publication health 检查按 workflow 条件 skipped；这次 Verify 只用于只读数据库计数与库存计划，不能替代完整发布历史核验。

## 二、五账号真实新增 Pin

**区间确认下限：5 条；完整区间最终数量未确认。** 下列均为唯一 Pin ID，发布时间以 Pinterest history 的 published_at 为准。

| 账号 | 已确认新增下限 | 完整区间最终数 | 快照时待发布 |
|---|---:|---|---:|
| P1 · icyndizhang | 3 | 未确认（08:33:07 后覆盖不完整） | 36 |
| P2 · sailing_981 | 0 | 未确认（截至快照确认 0） | 0 |
| P3 · mydecorshop | 2 | 未确认（08:33:07 后覆盖不完整） | 4 |
| P4 · cindyzhang62 | 0 | 未确认（截至快照确认 0） | 0 |
| P5 · ivy5205 | 0 | 未确认（截至快照确认 0） | 0 |

### 已核实 Pin 明细

| 账号 | Pinterest Pin | 店铺 | Etsy listing | published_at（UTC） | 北京时间 |
|---|---|---|---|---|---|
| P1 · icyndizhang | [801218590010044538](https://www.pinterest.com/pin/801218590010044538/) | GavinHome | [1408573323](https://www.etsy.com/listing/1408573323) | 2026-11-27 02:05:03.077018Z | 11-27 10:05:03.077018 |
| P1 · icyndizhang | [801218590010051306](https://www.pinterest.com/pin/801218590010051306/) | Chtte | [4577556837](https://www.etsy.com/listing/4577556837) | 2026-11-27 13:00:05.486557Z | 11-27 21:00:05.486557 |
| P1 · icyndizhang | [801218590010060107](https://www.pinterest.com/pin/801218590010060107/) | StellaGoodsGifts | [4557913906](https://www.etsy.com/listing/4557913906) | 2026-11-28 00:00:04.600632Z | 11-28 08:00:04.600632 |
| P3 · mydecorshop | [499618152434476996](https://www.pinterest.com/pin/499618152434476996/) | CellaHo | [4366152963](https://www.etsy.com/listing/4366152963) | 2026-11-27 13:05:02.368305Z | 11-27 21:05:02.368305 |
| P3 · mydecorshop | [499618152434480104](https://www.pinterest.com/pin/499618152434480104/) | LoomGoStudio | [4474248818](https://www.etsy.com/listing/4474248818) | 2026-11-28 00:05:02.817519Z | 11-28 08:05:02.817519 |

P2、P4、P5 在 11 月 27 日完整自然日及 11 月 28 日 08:33:07 快照前均没有新增 Pin 记录；但 08:33:07 至 10:00 的最后一段没有完整 history，故不能把最终区间数量写成 0。P1、P3 的 36、4 是快照时待发布库存，不是区间新增数。

### 发布、待处理与失败状态

- 区间内 GitHub Pinterest publisher workflow 共看到 3 次执行，均为 workflow success，但实际业务输出均为 idle、published=0：
  - [45926928529](https://github.com/Sailin09/Store-Promotion/actions/runs/45926928529)，job 140270308205，02:12:12–02:12:19Z：status idle，published 0，未提供附加原因。
  - [45985945912](https://github.com/Sailin09/Store-Promotion/actions/runs/45985945912)，job 140461473818，10:53:57–10:54:06Z：idle / outside_publish_window，published 0。
  - [46060382495](https://github.com/Sailin09/Store-Promotion/actions/runs/46060382495)，job 140712927916，19:58:30–19:58:36Z：idle / outside_publish_window，published 0。
- Issue #2 的 Supabase scheduler 最近记录中，00:00:00Z 与 00:05:00Z 两次为 HTTP 200 / published，对应上表 11 月 28 日 P1 与 P3 两条真实 Pin；00:10、00:15、00:20、00:25 为 idle；00:30 为 HTTP pending / 待完成且无附加原因。该 pending 项在快照时仍未有最终结果，列为**待确认**，不是失败，也不计为 Pin。
- 快照待发布数为 P1 36、P2 0、P3 4、P4 0、P5 0。没有证据支持把 P1/P3 的待发布项归类为失败；具体原因未在快照中逐条提供。
- 已修复的历史不确定项：P3 11 月 13 日 503 已通过原图板分页及数据库读回核清，实际 Pin [499618152434383938](https://www.pinterest.com/pin/499618152434383938/) 对应 listing 4616101190，真实发布时间为北京时间 11 月 13 日 21:15:11；已通过原完成函数补记为 published，未重发，见 Issue #2 评论 [7208678853](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-7208678853)。

## 三、区间新增补货素材与入库

**本区间没有可确认的新入库素材。**

- 四份 cloud-run 均记录新品发现受阻；最新 attempt 25/26 的状态为 blocked_before_storefront_request。没有详情页打开、卖家核验、Add to cart 核验、原始主图截图或视觉审核；可确认视觉审核数为 0。
- Etsy stock capture workflow [45930187374](https://github.com/Sailin09/Store-Promotion/actions/runs/45930187374) / job **140280773094** 于 2026-11-27T02:45:24Z–02:45:38Z 失败，实际响应 HTTP 403，脚本记录 retry_not_before = **2026-11-28T02:45:35.380Z**（北京时间 11 月 28 日 10:45:35.380）。本次没有绕过限制或再次请求 Etsy。
- 因没有通过核验的候选，本区间无可列出的 shop、Etsy 链接/listing_id、account/handle、Board 名称/ID、queue_id 或 queue_status；也没有可记录的来源截图及视觉核验时间。
- 新 batch：0 个。Replenish verified stock 未在本区间执行实际入库；最新候选 workflow run [45929967457](https://github.com/Sailin09/Store-Promotion/actions/runs/45929967457) 因上游部署失败而 skipped，job 140280129944 为 skipped。
- 首次 inserted、幂等重跑 inserted=0、queue_status、snapshot_matches 均为 **not_run**。这里不能写成首次 inserted=0 或 retry inserted=0；没有执行入库/重跑就没有幂等成功证据。当前没有观察到重复入库，但也没有新的入库验证可供确认。
- 云端补货自动化 **6adb18502ca08191b0b05f436915aee4** 仍为 enabled。最近一次 scheduled run 于 2026-11-27T23:15:00Z 执行并于 23:17:16Z 完成；下一次计划为 2026-11-28T05:15:00Z（北京时间 13:15）。本次未修改该任务。
- 首次缺口跟进文件 [first-deficit-followup.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json) 仍为 completed：首次真实 inserted=2、幂等 retry inserted=0、完成时剩余缺口 0；本日报没有重做或改写该历史跟进。

## 四、核验时点库存与 32 条路线缺口

以下是 **2026-11-28 10:02:44.838 北京时间附近**的当前库存快照，不是本日报区间内新增素材数量。最新 Verify 的 replenishment-plan.sql 每条路线 target=3：

**40 / 96 可用审核素材；当前缺口 56；32 条店铺/账号路线。**

| 账号 | handle | 路线数 | 可用 / 目标 | 缺口 |
|---|---|---:|---:|---:|
| P1 | icyndizhang | 18 | 36 / 54 | 18 |
| P2 | sailing_981 | 6 | 0 / 18 | 18 |
| P3 | mydecorshop | 3 | 4 / 9 | 5 |
| P4 | cindyzhang62 | 3 | 0 / 9 | 9 |
| P5 | ivy5205 | 2 | 0 / 6 | 6 |
| **合计** |  | **32** | **40 / 96** | **56** |

### 全部路线明细

| 账号 | 店铺 | Board ID | usable | target | deficit |
|---|---|---|---:|---:|---:|
| P1 | Chtte | 801218658646993070 | 1 | 3 | 2 |
| P1 | GavinHome | 801218658646993070 | 1 | 3 | 2 |
| P1 | MiraKiuStudio | 801218658646993070 | 1 | 3 | 2 |
| P1 | Parkermo | 801218658646993070 | 1 | 3 | 2 |
| P1 | ShirieHomeShow | 801218658646993070 | 1 | 3 | 2 |
| P1 | SobiaStudio | 801218658646993070 | 1 | 3 | 2 |
| P1 | StellaGoodsGifts | 801218658646993070 | 1 | 3 | 2 |
| P1 | AmyHomeCrafts | 801218658646993070 | 2 | 3 | 1 |
| P1 | HeyDream | 801218658646993070 | 2 | 3 | 1 |
| P1 | KorusStore | 801218658646993070 | 2 | 3 | 1 |
| P1 | TunaMunStudio | 801218658646993070 | 2 | 3 | 1 |
| P1 | beou | 801218658646993070 | 3 | 3 | 0 |
| P1 | ChicDecorHK | 801218658646993070 | 3 | 3 | 0 |
| P1 | CustomCurtainsStudio | 801218658646993070 | 3 | 3 | 0 |
| P1 | DanyHomeDesign | 801218658646993070 | 3 | 3 | 0 |
| P1 | FrenchStyleDecor | 801218658646993070 | 3 | 3 | 0 |
| P1 | NiceCraftStudioHK | 801218658646993070 | 3 | 3 | 0 |
| P1 | WOGOL | 801218658646993070 | 3 | 3 | 0 |
| P2 | Adamideal | 863494997243989843 | 0 | 3 | 3 |
| P2 | HibiChStudio | 863494997243989843 | 0 | 3 | 3 |
| P2 | KoltCraftStudio | 863494997243989843 | 0 | 3 | 3 |
| P2 | LambertHouse | 863494997243989843 | 0 | 3 | 3 |
| P2 | MiawoodStudio | 863494997243989843 | 0 | 3 | 3 |
| P2 | WoodHomeLiang | 863494997243989843 | 0 | 3 | 3 |
| P3 | Chtte | 499618221101215211 | 0 | 3 | 3 |
| P3 | CellaHo | 499618221101238533 | 2 | 3 | 1 |
| P3 | LoomGoStudio | 499618221101238533 | 2 | 3 | 1 |
| P4 | ChicDecorHK | 675399344058025061 | 0 | 3 | 3 |
| P4 | PearlsTreasuresArt | 675399344058025061 | 0 | 3 | 3 |
| P4 | QuGifts | 675399344056772225 | 0 | 3 | 3 |
| P5 | NinaJiaStudio | 713820678377803445 | 0 | 3 | 3 |
| P5 | NngGoods | 713820678377803412 | 0 | 3 | 3 |

库存分布：零库存路线 **12** 条、库存 1 条路线 **7** 条、库存 2 条路线 **6** 条、达到 target=3 的路线 **7** 条。唯一 known listing IDs 为 **584**。

Verify 同时读到数据库计数：shops/classified shops 30/30；products 584；Pinterest variants 584；Facebook variants 584；draft_queue 246；active shop-account mappings 32；Pinterest accounts 5；Pinterest routed queue 584。

**阈值口径说明：** 本日报的补货缺口严格使用用户指定且由 replenishment-plan.sql 实际执行的 **target=3**。operations/cloud-operations.md 与 Issue #2 的排程覆盖说明仍出现每路线 7 条的储备/覆盖口径；Issue #2 评论 7232108658 同时列出 7 条覆盖估算与 SQL 的 3 条补货缺口。两种口径不可混算；本日报不将 7 条覆盖目标替换为补货 SQL 阈值。

## 五、失败、修复与未解决事项

### 已恢复或已修复

- P3 11 月 13 日 503 历史尝试已核对为真实 published，按原完成函数补记且没有重发，见评论 7208678853。
- 区间内 cloud stock report 曾于 [run 46075612853](https://github.com/Sailin09/Store-Promotion/actions/runs/46075612853) / job 140762612290 失败，失败步骤为 Verify cloud stock and publication evidence，artifact 15234509468 已保留。随后 [run 46088419124](https://github.com/Sailin09/Store-Promotion/actions/runs/46088419124) / job 140803513160 于 00:32:20Z–00:33:20Z 以 stock 模式成功，生成 deficit=56 的 Issue #2 快照。后续运行恢复，但前一次失败根因仍未从日志中确定，不能称根因已修复。
- 截止后 main commit [3e4e8b0](https://github.com/Sailin09/Store-Promotion/commit/3e4e8b02bfc207c066086e17042f73cff7d97c9d) 于 2026-11-28T02:03:48Z 修改 capture-etsy-stock.cjs：在启动浏览器前检查 retry_not_before，冷却期间提前退出，并读取最新 32 条库存计划。Issue #2 评论 7232108658 记录了离线冷却退出与路线读取核验；真实 Etsy 来源访问仍需冷却结束后才能确认。此代码提交发生在逻辑截止之后，不计作区间入库或候选发现。

### 仍未解决

- Etsy HTTP 403 冷却到北京时间 11 月 28 日 10:45:35.380；本次 Verify 完成时冷却尚未结束。远程云端运行没有可用的 CDP 导航、点击和截图接口；未使用用户桌面或本地机器。
- Verify workflow 的最新自动 workflow_run [45929972769](https://github.com/Sailin09/Store-Promotion/actions/runs/45929972769) 仍 skipped；上游 Deploy run 45929905109 / job 140279974938 因 Supabase CLI 要求非交互确认部署一个 Function 而失败，日志写明 Nothing was changed。没有添加 --yes、没有部署或改动生产函数。本次只重跑了只读 Verify job。
- 00:30Z scheduler 的 HTTP pending 项没有最终状态；发布 history 在 08:33:07 后至 10:00 的区间覆盖不完整。
- 7 条储备/覆盖口径与 SQL target=3 的展示仍并存，尚未统一文案。本次没有修改报告脚本、云端运营文档或阈值。
- 没有新的补货素材入库，当前 SQL 缺口仍为 56；这不是通过零入队或 HTTP 200 推断出的成功。

## 六、保护状态与本轮操作边界

- 本轮只重跑了获授权的最新只读 Verify job；没有重跑 Cloud promotion operations、发布器或补货 workflow。
- 没有发布 Pin、创建 batch、入队、补货、修复、重置历史或去重记录，也没有修改任何发布、补货或首次跟进任务。
- Supabase 自动发布调度、GitHub cloud stock reporting 调度、账号/Board 映射、发布历史和去重保护保持原样。
- Etsy 云端补货任务 6adb18502ca08191b0b05f436915aee4 保持 enabled；下一次计划为北京时间 13:15。首次缺口跟进仍 completed。
- 没有使用用户电脑、桌面浏览器会话、本地路径或 Codex heartbeat；没有要求配置 OpenAI/Etsy API key。本轮没有触碰用户本地日报 ID10。
- Issue #2 当日评论与本文件使用同一份 Markdown；配套结构化证据保存于 operations/replenishment/daily-report-2026-11-28.json。

**本轮结论：** 已确认 5 条区间内真实 Pin（P1 3、P3 2），但 08:33:07 至 10:00 的最后 1 小时 26 分 52.533 秒没有完整发布历史，因此最终区间 Pin 总数仍未确认。当前 32 条路线按 target=3 有效素材 40/96、缺口 56；区间没有可确认的新补货素材入库，Etsy 403 冷却与云端浏览器能力限制仍阻塞实际发现和视觉审核。
