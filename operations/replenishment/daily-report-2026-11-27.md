# 执行日报 2026-11-27
<!-- store-promotion-daily:2026-11-27 -->

## 一、区间、时间与证据口径

- 仓库：[Sailin09/Store-Promotion](https://github.com/Sailin09/Store-Promotion)，本次写入前 main：04c76a16baf6b43d0d5c3509b4d6e5893a2629f5。
- 逻辑区间：**2026-11-26 10:00:00 至 2026-11-27 10:00:00（Asia/Shanghai）**，即 UTC **2026-11-26 02:00:00 至 2026-11-27 02:00:00**。
- 上次成功日报截止：2026-11-26 10:00:00（UTC 02:00:00）；本区间起点含、终点不含。
- 实际核验：云端发布快照数据时间为 **2026-11-27 01:00:56.257957Z（09:00:56.257957 北京时间）**；最新只读 Verify 重跑于 **02:04:02Z 开始、02:04:18Z 完成（10:04:02–10:04:18 北京时间）**，较逻辑截止晚 **4分18秒**。
- 库存最新数据时间：Verify attempt 22 的 replenishment_plan 输出时间 **2026-11-27 02:04:15.818627Z（10:04:15.818627 北京时间）**，属于截止后核验，仅作为当前库存快照，不计入本区间事件。
- **发布历史覆盖不完整：**可核实的最新发布快照停在 01:00:56.257957Z，距离逻辑截止尚有 **59分03.742043秒**。该段没有新的完整发布历史快照；因此下文 Pin 数量是截至快照的已确认下限，完整区间最终总数标为未确认，不用 workflow success、HTTP 200 或 idle 补足。
- 已读取 state 文件、main 最新证据目录、operations/cloud-operations.md、Issue #2 全部 **194 条评论（100+94，2页）**、按标题检索到的发布复核 Issue、发布/补货/Verify 工作流及实际 job 日志。Issue #2 中尚无 2026-11-27 日报标记；最近成功日报为 2026-11-26，comment **7180531141**。
- 计数按唯一 Pin ID 与真实 published_at 计算；没有使用 2026-10-23 的历史累计基线 62 作为每日基线。Issue 快照里的累计数和“实际新增”累计统计不作为本区间数量。

## 二、Pinterest 发布结果

### 2.1 五账号汇总

| 账号 | 截至快照已确认新增 Pin | 快照时待发布 | 完整区间最终数 |
|---|---:|---:|---|
| P1 / icyndizhang | 3 | 39 | **未确认**（快照后仍有59分03.742秒覆盖空档） |
| P2 / sailing_981 | 2 | 0 | **未确认**（快照后仍有59分03.742秒覆盖空档） |
| P3 / mydecorshop | 0 | 6 | **未确认**（快照后仍有59分03.742秒覆盖空档） |
| P4 / cindyzhang62 | 0 | 0 | **未确认**（快照后仍有59分03.742秒覆盖空档） |
| P5 / ivy5205 | 0 | 0 | **未确认**（快照后仍有59分03.742秒覆盖空档） |
| **合计** | **5** | **45** | **至少5；完整区间总数未确认** |

“0”仅表示截至 01:00:56.257957Z 的快照未列出该账号新增 Pin，不代表最后59分没有发布。P1/P2 的 3/2 条也只是快照确认数，不将其误报为完整区间最终值。

### 2.2 已确认的全部新增 Pin

| 账号 | 店铺 | Etsy 商品 | Pin | 实际发布时间（北京时间） |
|---|---|---|---|---|
| P1 / icyndizhang | StellaGoodsGifts | [4579441057](https://www.etsy.com/listing/4579441057) | [801218590010027044](https://www.pinterest.com/pin/801218590010027044/) | 2026-11-26 10:05:02.535501 |
| P1 / icyndizhang | TunaMunStudio | [4605390280](https://www.etsy.com/listing/4605390280) | [801218590010033198](https://www.pinterest.com/pin/801218590010033198/) | 2026-11-26 21:00:05.410706 |
| P1 / icyndizhang | AmyHomeCrafts | [1481500391](https://www.etsy.com/listing/1481500391) | [801218590010043132](https://www.pinterest.com/pin/801218590010043132/) | 2026-11-27 08:00:03.108474 |
| P2 / sailing_981 | WoodHomeLiang | [4433496103](https://www.etsy.com/listing/4433496103) | [863494928599785733](https://www.pinterest.com/pin/863494928599785733/) | 2026-11-26 10:10:02.211381 |
| P2 / sailing_981 | LambertHouse | [4314290016](https://www.etsy.com/listing/4314290016) | [863494928599791439](https://www.pinterest.com/pin/863494928599791439/) | 2026-11-26 21:05:02.425246 |

以上 5 个 Pin ID 唯一，发布时间均落在逻辑区间内；源快照原始时间均为 UTC，表中转换为北京时间。

### 2.3 未发布、待处理及失败记录

- 01:00:56Z Issue #2 快照列出的待发布数：P1 **39**、P3 **6**、P2/P4/P5 **0**。这些是快照时点的队列统计，不等于已发布，也不是截止时的最终队列状态。
- 快照中的调度记录显示 01:00:00.089220Z 请求仍为 **pending**；00:55 至 00:15Z 的最近若干请求为 **idle**。HTTP 200 / idle 不计作发布成功。
- P3 历史未决记录仍缺少解决证据：queue_id **35c31472-0b55-4f6d-bd70-eb336463ee80**，attempt_id **c6bd08a5-afc4-495c-a309-8482d88efefb**，历史状态 **uncertain**，错误 **pin_response_503**，started_at **2026-11-13T13:15:03.013284Z**；没有可核实 Pin ID 或 publish_history。它不是本区间新产生的失败。最新 Verify 的 queue inspection 因 push 事件被跳过，故本次不能确认它已解决。
- 本区间 Cloud promotion operations 的 **run 45905382532 / job 140200876261** 在 cloud-report 步骤失败；日志只给出通用错误，未暴露具体数据库/业务原因。它是运行核验失败，不据此虚构一条 Pin 发布失败。历史 P3 uncertain 是已知风险，但不能仅凭这次通用错误断言两者为同一原因。
- Pinterest publisher 的两次工作流日志均输出 idle / outside_publish_window、published=0：这表示该两次 GitHub job 没有执行发布批次，不代表整个区间没有发布；实际 Pin 仍以 01:00:56Z 的真实发布快照为准。
- 按标题搜索到的发布复核 Issue 仍是 [Issue #3：Pinterest 2026-10-23 21:35 发布复核](https://github.com/Sailin09/Store-Promotion/issues/3)，创建于 2026-10-23、仍 open、无评论；本区间未发现新的发布复核 Issue。

## 三、补货素材与入库

### 3.1 本区间新增入库

**本区间真实新增补货素材：0 条。** main 的 replenishment 证据目录没有 2026-11-26/27 新 batch；四份区间 cloud-run 证据均显示未创建新 batch、未触发 Replenish verified stock。没有可列的本区间新 queue_id。

| shop | Etsy 链接 / listing_id | account / handle | Board 名称 / ID | queue_id | queue_status | snapshot_matches | 来源与实际视觉核验 | 首次 inserted | 幂等重跑 inserted |
|---|---|---|---|---|---|---|---|---:|---:|
| **无新增入库** | — | — | — | — | not_run | not_run | 未发现可进入实际视觉核验的候选 | not_run | not_run |

- 云端运行记录显示 remote CDP 仅暴露只读 tab listing/context，没有远程页面导航、点击/输入和截图能力；没有访问 Etsy storefront、查看详情或实际主图。最新补货运行记录为 **new_candidates=0、visual_verified=0、batch_created=false、replenish_workflow_triggered=false**。这表示当前运行环境没有取得候选，不表示 Etsy 上不存在新商品。
- **未入库候选：未确认。** 因未能进入 Etsy 页面，无法产生经卖家、在售状态和主图核验的候选清单；未把搜索摘要或图片 URL 当作视觉审核。
- 本区间首次 inserted 为 **not_run**，retry inserted 为 **not_run**，queue_status / snapshot_matches 均为 **not_run**；没有实际 inserted=0 幂等重跑证据，也没有可以报告的 queue_id。不得将 not_run 改写为成功的 inserted=0。
- 最近一批历史批次是 2026-11-22 的 batch-20261122-051903（**不属于本区间**）。其 Replenish verified stock run **44988950045 / job 137105705490** 首次 inserted=5、failed=0；同一 job 的真实幂等重跑返回 no_new_verified_material、inserted=0。该批次 5 个 listing_id（FrenchStyleDecor 1884132251、KoltCraftStudio 1883988142、KorusStore 4405714144、LambertHouse 4314290016、NngGoods 4537650021）已在后续 Verify 的 known_listing_ids 中，均作为历史 ID 排除，不重复计入本区间。
- 本区间没有新的补货入库失败或重复插入证据；由于没有执行入库，不能把重复数/失败数写成经过幂等验证的零。

### 3.2 当前库存快照（截止后只读核验）

Verify Supabase Data **run 45016861552 / attempt 22 / job 140267749347** 在逻辑截止后完成。其 replenishment_plan 使用当前 main 对应的 SQL 逻辑 target=3，输出 32 条路线：

| 指标 | 截止后核验值 |
|---|---:|
| 有效店铺/账号路线 | 32 |
| 每路线目标 | 3 |
| 总目标库存 | 96 |
| 当前 usable | 45 |
| 总缺口 | **51** |
| 零库存路线 | 12 |
| usable=1 路线 | 4 |
| usable=2 路线 | 7 |
| 已达标路线 | 9 |
| unique known_listing_ids | 584 |

#### 32 条路线逐项库存

| 店铺 | 账号 / handle | Board ID | usable / target | 缺口 |
|---|---|---|---:|---:|
| Adamideal | P2 / sailing_981 | 863494997243989843 | 0 / 3 | 3 |
| ChicDecorHK | P4 / cindyzhang62 | 675399344058025061 | 0 / 3 | 3 |
| Chtte | P3 / mydecorshop | 499618221101215211 | 0 / 3 | 3 |
| HibiChStudio | P2 / sailing_981 | 863494997243989843 | 0 / 3 | 3 |
| KoltCraftStudio | P2 / sailing_981 | 863494997243989843 | 0 / 3 | 3 |
| LambertHouse | P2 / sailing_981 | 863494997243989843 | 0 / 3 | 3 |
| MiawoodStudio | P2 / sailing_981 | 863494997243989843 | 0 / 3 | 3 |
| NinaJiaStudio | P5 / ivy5205 | 713820678377803445 | 0 / 3 | 3 |
| NngGoods | P5 / ivy5205 | 713820678377803412 | 0 / 3 | 3 |
| PearlsTreasuresArt | P4 / cindyzhang62 | 675399344058025061 | 0 / 3 | 3 |
| QuGifts | P4 / cindyzhang62 | 675399344056772225 | 0 / 3 | 3 |
| WoodHomeLiang | P2 / sailing_981 | 863494997243989843 | 0 / 3 | 3 |
| MiraKiuStudio | P1 / icyndizhang | 801218658646993070 | 1 / 3 | 2 |
| Parkermo | P1 / icyndizhang | 801218658646993070 | 1 / 3 | 2 |
| ShirieHomeShow | P1 / icyndizhang | 801218658646993070 | 1 / 3 | 2 |
| SobiaStudio | P1 / icyndizhang | 801218658646993070 | 1 / 3 | 2 |
| AmyHomeCrafts | P1 / icyndizhang | 801218658646993070 | 2 / 3 | 1 |
| Chtte | P1 / icyndizhang | 801218658646993070 | 2 / 3 | 1 |
| GavinHome | P1 / icyndizhang | 801218658646993070 | 2 / 3 | 1 |
| HeyDream | P1 / icyndizhang | 801218658646993070 | 2 / 3 | 1 |
| KorusStore | P1 / icyndizhang | 801218658646993070 | 2 / 3 | 1 |
| StellaGoodsGifts | P1 / icyndizhang | 801218658646993070 | 2 / 3 | 1 |
| TunaMunStudio | P1 / icyndizhang | 801218658646993070 | 2 / 3 | 1 |
| beou | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| CellaHo | P3 / mydecorshop | 499618221101238533 | 3 / 3 | 0 |
| ChicDecorHK | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| CustomCurtainsStudio | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| DanyHomeDesign | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| FrenchStyleDecor | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| LoomGoStudio | P3 / mydecorshop | 499618221101238533 | 3 / 3 | 0 |
| NiceCraftStudioHK | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| WOGOL | P1 / icyndizhang | 801218658646993070 | 3 / 3 | 0 |
| **合计** | **32 条路线** | — | **45 / 96** | **51** |

以上是 10:04:15.818627 北京时间的当前库存状态，不是 10:00 截止前的区间补货数量。截止前最后一次独立 Verify（attempt 21，23:16:11Z）为 usable 46、deficit 50；01:00:56Z 发布快照和截止后 attempt 22 显示库存已变为 usable 45、deficit 51。

### 3.3 首次缺口跟进与补货自动化

- [first-deficit-followup.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json) 状态仍为 **completed**，完成时间 2026-10-23T13:52:56.578Z；首次真实入库 2 条、真实 retry inserted=0、当时 remaining_deficit=0。本次没有重复执行该一次性跟进。
- Etsy 云端持续补货自动化 **6adb18502ca08191b0b05f436915aee4** 经只读读取仍为 **enabled**；最近一次计划运行 2026-11-26T23:15:00Z，实际完成 23:17:46Z；下一次计划 2026-11-27T05:15:00Z。其 prompt、排程和启停状态均未修改。
- 长期补货任务继续保持原样；没有触发补货 workflow，没有入队，没有修改发布调度或跟进任务。

## 四、工作流与实际 job 日志

### 4.1 Verify Supabase Data

| 时间（UTC） | Attempt / Job | 结果 | 数据库库存 | 队列/调度检查 |
|---|---|---|---|---|
| 11-26 05:17:54–05:18:09 | attempt 18 / 139709621929 | success | usable 48 / deficit 48 | push 事件跳过 |
| 11-26 11:16:54–11:17:23 | attempt 19 / 139872155364 | success | usable 48 / deficit 48 | push 事件跳过 |
| 11-26 17:18:05–17:18:18 | attempt 20 / 140070720631 | success | usable 46 / deficit 50 | push 事件跳过 |
| 11-26 23:15:55–23:16:11 | attempt 21 / 140215452226 | success | usable 46 / deficit 50 | push 事件跳过 |
| **11-27 02:04:02–02:04:18（截止后）** | **attempt 22 / 140267749347** | **success** | **usable 45 / deficit 51** | **push 事件跳过** |

attempt 22 的数据库基础计数：30 shops、30 classified、584 products、584 Pinterest variants、584 Facebook variants、246 draft_queue、32 active mappings、5 Pinterest accounts、584 Pinterest routed queue。attempt 22 的 replenishment_plan 步骤成功，但 Pinterest queue inspection 与 scheduler/publication health inspection 被 push 事件条件跳过；因此不能称为完整发布健康核验。该重跑沿用原 workflow run 的 checkout commit 08bd574e；本次读取的 main 为 04c76a16，当前 main 的 replenishment-plan.sql SHA f2cdd7c4、verify-supabase.yml SHA 7f7ab349 与原运行使用文件一致。

[Verify Supabase Data run](https://github.com/Sailin09/Store-Promotion/actions/runs/45016861552) · [截止后 attempt 22 job](https://github.com/Sailin09/Store-Promotion/actions/runs/45016861552/job/140267749347)

### 4.2 Cloud promotion operations

| 时间（UTC） | Run / Job | 结果与实际输出 |
|---|---|---|
| 11-26 15:16 左右 | 45847373646 / 140004723329 | success；Issue #2 库存快照 deficit 50 |
| 11-26 22:32:21–22:32:36 | 45905382532 / 140200876261 | **failure**；SQL schedule 安装步骤完成，scripts/cloud-report.mjs 退出码 1；日志仅有通用失败信息，未给出具体根因；artifact 15158170550 已保存 |
| 11-27 01:00:54–01:01:09 | 45920002331 / 140248339645 | success；mode=stock、deficit=51；生成 Issue #2 发布/库存快照 comment 7206940198 |

- [15:16 cloud operations run](https://github.com/Sailin09/Store-Promotion/actions/runs/45847373646)
- [22:32 failed run](https://github.com/Sailin09/Store-Promotion/actions/runs/45905382532) · [失败日志 artifact](https://github.com/Sailin09/Store-Promotion/actions/runs/45905382532/artifacts/15158170550)
- [01:00 cloud operations run](https://github.com/Sailin09/Store-Promotion/actions/runs/45920002331)

### 4.3 Pinterest publisher

- 2026-11-26 08:22:13Z，run 45782566251 / job 139781320783：idle、outside_publish_window、published=0。
- 2026-11-26 19:01:57Z，run 45880519327 / job 140118379583：idle、outside_publish_window、published=0。
- 这两次 job 没有执行发布批次；不能用它们的 published=0 覆盖数据库真实 Pin 历史。区间确认的 5 条 Pin 来自 Issue #2 快照的真实 Pin ID 与 published_at。

[08:22 publisher run](https://github.com/Sailin09/Store-Promotion/actions/runs/45782566251) · [19:01 publisher run](https://github.com/Sailin09/Store-Promotion/actions/runs/45880519327)

### 4.4 补货 workflow 最近一次真实执行（区间外）

最近一次 Replenish verified stock 为 2026-11-22 的 **run 44988950045 / job 137105705490**，在本区间之前。该 job 的首次插入 5 条、failed=0；随后实际幂等重跑输出 inserted=0。区间内没有新的 Replenish verified stock run，也没有新的 batch。

[最近一次 Replenish verified stock run](https://github.com/Sailin09/Store-Promotion/actions/runs/44988950045)

## 五、已修复与未解决事项

**已完成且保持原样**
- 首次缺口跟进仍为 completed；不重复执行。
- 2026-11-22 历史批次的 5 个 listing_id 均已进入 known_listing_ids，后续候选排重有效。
- Supabase 自动发布、五账号发布历史、去重记录和现有发布限制均未被本次日报修改。

**仍未解决 / 未确认**
1. **P3 uncertain 发布记录**：queue_id 35c31472-0b55-4f6d-bd70-eb336463ee80 / attempt_id c6bd08a5-afc4-495c-a309-8482d88efefb，pin_response_503；当前 Verify 未读取队列，不能确认状态是否变化。
2. **Etsy 云端发现阻塞**：缺少远程 CDP 页面导航、点击和截图控制；本区间没有完成新的 Etsy 商品详情及主图核验。
3. **库存目标文案不一致**：当前 scripts/replenishment-plan.sql 和 32 条最新 replenishment_plan 均为 target=3；但 operations/cloud-operations.md 仍保留 target=7 的旧文案，Issue #2 最新快照汇总文字也写“7 条目标”，而逐路线待补数字和总缺口 51 实际与 target=3 一致。此处是文案/口径问题，本次未修改。
4. **Cloud promotion operations 22:32 失败**：已保存 artifact，但实际日志没有暴露 scripts/cloud-report.mjs 的具体失败根因，仍需后续只读诊断。
5. **发布覆盖空档**：01:00:56Z 之后至 02:00:00Z 没有可核实的发布历史快照，完整区间 Pin 总数未确认。

## 六、证据索引与投递

- [Issue #2：Pinterest 云端库存与运行状态](https://github.com/Sailin09/Store-Promotion/issues/2)；已扫描全部 194 条评论，本次日期标记此前不存在。
- [Issue #3：Pinterest 2026-10-23 21:35 发布复核](https://github.com/Sailin09/Store-Promotion/issues/3)；按标题搜索确认，无新复核 Issue。
- [cloud-run 2026-11-26 05:18](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261126-051809.json)
- [cloud-run 2026-11-26 11:17](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261126-111723.json)
- [cloud-run 2026-11-26 17:18](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261126-171805.json)
- [cloud-run 2026-11-26 23:16](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261126-231611.json)
- [first-deficit-followup.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json)
- [operations/cloud-operations.md](https://github.com/Sailin09/Store-Promotion/blob/main/operations/cloud-operations.md)
- 本日报完整 Markdown： [daily-report-2026-11-27.md](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-27.md)
- 配套机器可读证据： [daily-report-2026-11-27.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-27.json)

本次日报只读汇报业务状态；除日报 Markdown、配套 JSON、Issue #2 日报评论及日报状态文件外，没有触发发布、补货、入队、修复、重置历史或更改任何业务任务。全程使用云端 GitHub/Automations 连接器；没有使用用户电脑、桌面会话、本地路径、Codex 进程或 heartbeat，没有要求配置 OpenAI/Etsy API key，没有创建本地任务，也没有触碰用户本地日报 ID10。