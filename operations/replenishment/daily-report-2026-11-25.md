# 执行日报 2026-11-25
<!-- store-promotion-daily:2026-11-25 -->

## 一、区间、核验时间与证据覆盖

- 逻辑区间：北京时间 **2026-11-24 10:00（含）—2026-11-25 10:00（不含）**；UTC **2026-11-24T02:00:00Z—2026-11-25T02:00:00Z**。
- 上一次成功日报截止：**2026-11-24T02:00:00Z**，取自 `cloud-daily-report-state.json`。本次按此截止续接，没有用历史累计62条作为每日基线。
- 实际只读核验完成：**2026-11-25T02:02:05.382Z（北京时间10:02:05.382）**，晚于逻辑截止 **125秒**。所有区间计数仍严格排除02:00Z及之后事件。
- 最新发布历史快照：Issue #2 评论 [7149543055](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-7149543055)，快照时间 **2026-11-25T01:26:05.565814Z**（北京时间09:26:05.566）。该快照距逻辑截止尚有 **33分54.434秒**，因此发布历史未覆盖完整区间。下文Pin数量是该快照内按真实 published_at 过滤得到的**已确认下限**；各账号最终区间总数均标记为未确认。
- 截止后另行读取的只读 Verify 数据时间为 **2026-11-25T02:02:04.457Z—02:02:05.061Z**，只用于当前库存快照，不计入区间Pin或补货新增量。
- 本次读取了 main 上的 `operations/replenishment/cloud-daily-report-state.json`、证据目录、`operations/cloud-operations.md`、全部 **185条** Issue #2 评论、发布复核 Issue 及其评论、发布/补货/Verify 工作流和实际 job 日志。Issue #2 中已有32条每日标记评论；未发现 `store-promotion-daily:2026-11-25`，因此本日可新增一条。按标题搜索到的发布复核 Issue 为 [#3：Pinterest 2026-10-23 21:35 发布复核](https://github.com/Sailin09/Store-Promotion/issues/3)，其评论数为0；未发现更新日期的独立复核 Issue。
- 写入前 main HEAD：[`6b36d4d5e518494dde34ac8e90e0509083226a05`](https://github.com/Sailin09/Store-Promotion/commit/6b36d4d5e518494dde34ac8e90e0509083226a05)。

### Verify Supabase Data

- 最新只读核验已获授权重跑并完成：[run 45016861552 / attempt 12 / job 138922663459](https://github.com/Sailin09/Store-Promotion/actions/runs/45016861552/job/138922663459)。
- 开始 **2026-11-25T02:01:50Z**，完成 **02:02:05Z**；事件类型为 push，执行的是只读数据库核验。
- 数据库计数时间约 **02:02:04.457Z**；replenishment_plan 逐路线输出时间 **02:02:05.045Z—02:02:05.061Z**。SQL SHA 与 main 一致。
- 数据库计数：30家店铺、30家已分类、584个商品、584条 Pinterest variants、246条 draft queue、32条 active shop/account 映射、5个 Pinterest账号、584条已路由 Pinterest queue。
- `verify-supabase.yml` 的只读队列/调度检查条件为事件类型不是 push；本次 push 重跑因此跳过这两步。`Verify Store Promotion database` 与 `Inspect replenishment deficits` 成功，但本次 Verify **不构成完整队列或发布调度健康核验**，不能把 workflow success 当作业务成功。
- 区间发布证据覆盖：Issue #2 的最新完整Pin快照只到 **01:26:05.566Z**；01:26:05.566Z至02:00:00Z这 **33分54.434秒**没有可独立验证的完整发布历史。该时段最终是否还有Pin，标记**未确认**。
- 截止后事件：02:02:05Z 的 Verify 是截止后只读核验，不计入区间。没有从现有证据确认截止后新增Pin或补货；但发布快照缺口也不允许据此断言截止后绝无事件。

## 二、五个Pinterest账号的区间新增Pin

统计方法：逐条读取 Issue #2 最新发布历史快照中的唯一Pin记录，按 published_at 落入 **[2026-11-24T02:00:00Z, 2026-11-25T02:00:00Z)** 过滤；不使用累计新增数或累计62条基线。快照共解析379条历史Pin记录，本区间匹配7条，7个Pin ID均唯一。

| 账号 | 已确认新增（快照下限） | 最终区间总数 | 快照时待发布 |
|---|---:|---|---:|
| P1 / icyndizhang | 3 | 未确认（快照后33分54秒覆盖缺口） | 45 |
| P2 / sailing_981 | 3 | 未确认（快照后33分54秒覆盖缺口） | 5 |
| P3 / mydecorshop | 0（快照内未发现） | 未确认 | 6 |
| P4 / cindyzhang62 | 0（快照内未发现） | 未确认 | 0 |
| P5 / ivy5205 | 1 | 未确认（快照后33分54秒覆盖缺口） | 1 |
| **合计** | **7** | **未确认** | **57** |

### 已确认Pin明细

| 账号 | 店铺 | Etsy商品ID / 链接 | Pinterest Pin | published_at（UTC） |
|---|---|---|---|---|
| P1 / icyndizhang | ShirieHomeShow | 4334557253 · [Etsy listing](https://www.etsy.com/listing/4334557253) | [801218590009991723](https://www.pinterest.com/pin/801218590009991723/) | 2026-11-24T02:05:03.177565Z |
| P1 / icyndizhang | SobiaStudio | 4335736083 · [Etsy listing](https://www.etsy.com/listing/4335736083) | [801218590009998640](https://www.pinterest.com/pin/801218590009998640/) | 2026-11-24T13:00:03.656264Z |
| P1 / icyndizhang | MiraKiuStudio | 4385580248 · [Etsy listing](https://www.etsy.com/listing/4385580248) | [801218590010008158](https://www.pinterest.com/pin/801218590010008158/) | 2026-11-25T00:00:03.665438Z |
| P2 / sailing_981 | Adamideal | 4484587271 · [Etsy listing](https://www.etsy.com/listing/4484587271) | [863494928599755983](https://www.pinterest.com/pin/863494928599755983/) | 2026-11-24T02:10:03.123294Z |
| P2 / sailing_981 | KoltCraftStudio | 4576346337 · [Etsy listing](https://www.etsy.com/listing/4576346337) | [863494928599761863](https://www.pinterest.com/pin/863494928599761863/) | 2026-11-24T13:05:03.216351Z |
| P2 / sailing_981 | WoodHomeLiang | 1753118426 · [Etsy listing](https://www.etsy.com/listing/1753118426) | [863494928599769901](https://www.pinterest.com/pin/863494928599769901/) | 2026-11-25T00:05:02.472003Z |
| P5 / ivy5205 | NngGoods | 4392493982 · [Etsy listing](https://www.etsy.com/listing/4392493982) | [713820609738131872](https://www.pinterest.com/pin/713820609738131872/) | 2026-11-24T02:50:03.073655Z |

### 未发布、失败与待处理

以下待发布数来自 **01:26:05.566Z** 的快照，是该时点队列状态，不是区间发布数：

- P1：45条待发布。
- P2：5条待发布。
- P3：6条待发布；另有未决尝试 queue_id `35c31472-0b55-4f6d-bd70-eb336463ee80`，attempt_id `c6bd08a5-afc4-495c-a309-8482d88efefb`，状态 **uncertain**，错误 `pin_response_503`，没有可核实的Pin ID / publication history。保留不确定状态，不计作成功，也没有重试或清除历史。
- P4：0条待发布；快照内本区间新增为0，最终区间数量仍未确认。
- P5：1条待发布。
- 两次区间内 GitHub Publisher job：[run 45379602329 / job 138394877251](https://github.com/Sailin09/Store-Promotion/actions/runs/45379602329/job/138394877251) 与 [run 45488852347 / job 138781425059](https://github.com/Sailin09/Store-Promotion/actions/runs/45488852347/job/138781425059) 均记录 `idle / outside_publish_window`、`published=0`。这只说明这两次Publisher job没有发布，不替代Supabase真实Pin历史，也不能证明区间没有其他Pin。
- Issue #2 快照显示 Supabase 发布调度为 enabled、cron `*/5 * * * *`；最近一次列出的 **01:25:00.316Z** 调用仍是“HTTP待完成”，01:20及之前若干次为idle。最新Verify跳过了调度健康检查，故截止时的调度最终健康状态未重新确认。

## 三、区间新增补货素材与入库

**区间无已确认新增入库**

- main 的 replenishment 证据目录没有 **2026-11-24** 区间内新增的 batch 文件；最新批次仍是 [batch-20261122-051903.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261122-051903.json)，属于区间外，不计入本日报。
- 区间内新增 batch **0**、新增入库素材 **0**、新增 queue_id **0**。
- 因没有入库动作，首次 inserted、failed、实际幂等重跑 inserted=0 均为 **未执行 / 不适用**，不能把“未执行”写成“幂等验证成功”。本区间没有可列出的新增素材，以下字段均不适用：shop、Etsy listing、account/handle、Board名称/ID、queue_id、queue_status、snapshot_matches、首次inserted、retry inserted。
- 未入库候选：**数量未评估（不是0个候选）**。四次云端检查都在 Etsy 导航前被浏览器能力阻断，未访问店铺、未打开商品详情、未核验卖家/库存/Add to cart、未查看原始主图截图；实际视觉核验候选 **0条**。
- 四份区间 cloud-run 证据：
  - [2026-11-24 05:16:40Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261124-051640.json)：Verify attempt 8 / job 138235565110。
  - [2026-11-24 11:16:58Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261124-111658.json)：Verify attempt 9 / job 138405518500。
  - [2026-11-24 17:16:58Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261124-171658.json)：Verify attempt 10 / job 138632553961。
  - [2026-11-24 23:16:20Z](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261124-231620.json)：Verify attempt 11 / job 138849752768。
- 区间内没有新增的独立 verification-*.json 文件；Verify 证据由四份 cloud-run 记录及其关联 job 日志提供，历史 verification-20261023 文件不计入本区间。
- 四次记录的共同阻塞原因：Browser.list_tabs 返回 `Browser access requires the originating browser context`；当前运行没有远程CDP导航、点击和截图能力。没有创建batch，没有触发 Replenish verified stock，没有执行首次inserted或retry，也没有把未核验商品入队。
- 本区间没有新素材重复或入库失败记录；由于没有入库尝试，不能声称本区间已完成幂等验证。最新Verify显示584条Pinterest routed queue，但队列检查步骤被跳过，这不是新增补货或队列健康证明。

## 四、最新库存与各路线缺口

**库存为截止后只读核验时点值，不是本区间新增量。** 数据来自 Verify attempt 12，replenishment_plan 时间 **2026-11-25T02:02:05.045Z—02:02:05.061Z**：

- 有效路线：32条；每条 target 均为 **3**。
- 总目标：96；当前 usable：**57**；总缺口：**39**。
- 0/3：7条路线，缺口21。
- 1/3：5条路线，缺口10。
- 2/3：8条路线，缺口8。
- 3/3：12条路线，缺口0。

| 店铺路线 | 账号 / handle | usable / target | deficit |
|---|---|---:|---:|
| ChicDecorHK | P4 / cindyzhang62 | 0 / 3 | 3 |
| Chtte | P3 / mydecorshop | 0 / 3 | 3 |
| HibiChStudio | P2 / sailing_981 | 0 / 3 | 3 |
| MiawoodStudio | P2 / sailing_981 | 0 / 3 | 3 |
| NinaJiaStudio | P5 / ivy5205 | 0 / 3 | 3 |
| PearlsTreasuresArt | P4 / cindyzhang62 | 0 / 3 | 3 |
| QuGifts | P4 / cindyzhang62 | 0 / 3 | 3 |
| Adamideal | P2 / sailing_981 | 1 / 3 | 2 |
| KoltCraftStudio | P2 / sailing_981 | 1 / 3 | 2 |
| MiraKiuStudio | P1 / icyndizhang | 1 / 3 | 2 |
| NngGoods | P5 / ivy5205 | 1 / 3 | 2 |
| WoodHomeLiang | P2 / sailing_981 | 1 / 3 | 2 |
| Chtte | P1 / icyndizhang | 2 / 3 | 1 |
| GavinHome | P1 / icyndizhang | 2 / 3 | 1 |
| HeyDream | P1 / icyndizhang | 2 / 3 | 1 |
| KorusStore | P1 / icyndizhang | 2 / 3 | 1 |
| LambertHouse | P2 / sailing_981 | 2 / 3 | 1 |
| Parkermo | P1 / icyndizhang | 2 / 3 | 1 |
| ShirieHomeShow | P1 / icyndizhang | 2 / 3 | 1 |
| SobiaStudio | P1 / icyndizhang | 2 / 3 | 1 |
| AmyHomeCrafts | P1 / icyndizhang | 3 / 3 | 0 |
| beou | P1 / icyndizhang | 3 / 3 | 0 |
| CellaHo | P3 / mydecorshop | 3 / 3 | 0 |
| ChicDecorHK | P1 / icyndizhang | 3 / 3 | 0 |
| CustomCurtainsStudio | P1 / icyndizhang | 3 / 3 | 0 |
| DanyHomeDesign | P1 / icyndizhang | 3 / 3 | 0 |
| FrenchStyleDecor | P1 / icyndizhang | 3 / 3 | 0 |
| LoomGoStudio | P3 / mydecorshop | 3 / 3 | 0 |
| NiceCraftStudioHK | P1 / icyndizhang | 3 / 3 | 0 |
| StellaGoodsGifts | P1 / icyndizhang | 3 / 3 | 0 |
| TunaMunStudio | P1 / icyndizhang | 3 / 3 | 0 |
| WOGOL | P1 / icyndizhang | 3 / 3 | 0 |
| **合计** | **32条路线** | **57 / 96** | **39** |

与上一份成功日报的库存快照（usable 66、缺口30，数据时间2026-11-23T23:19:10.069Z）相比，本次核验时 usable 少9、缺口多9。该变化是两个核验时点之间的库存差异；本区间没有新增补货入库，不能把差额解释为本区间补货。

## 五、失败、修复与未解决事项

1. **Cloud promotion operations 报告失败仍未查明根因。** [run 45508062853 / job 138848512122](https://github.com/Sailin09/Store-Promotion/actions/runs/45508062853)，2026-11-24T23:13:14Z开始，23:14Z前结束；步骤 Verify cloud stock and publication evidence 执行 `node scripts/cloud-report.mjs` 退出码1。日志只输出 `Cloud report failed; inspect workflow steps. No credentials logged.`，脚本catch隐藏了底层异常，根因未确认；artifact [14974820775](https://github.com/Sailin09/Store-Promotion/actions/runs/45508062853/artifacts/14974820775) 已上传。后续 [run 45525621754 / job 138908236264](https://github.com/Sailin09/Store-Promotion/actions/runs/45525621754/job/138908236264) 于01:25:44Z—01:26:16Z成功运行并报告 deficit=39，但这不等于前次失败根因已修复。本日报没有重跑该失败工作流或修改脚本。
2. **Etsy新品发现仍受远程浏览器限制。** 四次cloud-run均未能导航到Etsy，未完成卖家、在售状态、Add to cart和原图视觉核验；阻塞未解决。
3. **P3发布结果不确定仍保留。** queue_id `35c31472-0b55-4f6d-bd70-eb336463ee80` 的 `pin_response_503` 没有可核实Pin结果；没有重试或清除去重记录。
4. **target=3修正保持有效，但运维文档口径过期。** 最新Verify的32条路线全部target=3，当前 `scripts/replenishment-plan.sql` 也明确使用3；`operations/replenishment/README.md` 同样按每路线3条说明。不过 `operations/cloud-operations.md` 的历史段落仍写“material-reserve target seven”，与当前SQL/README不一致。该文档未修改，本次也没有修改SQL、Board映射或补货规则。
5. **首次缺口跟进保持completed。** [first-deficit-followup.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json) 记录状态 completed，时间 **2026-10-23T13:52:56.578Z**；首次缺口跟进闭环不再重复执行，长期按缺口补货仍保持独立。
6. **每6小时Etsy云端补货任务保持启用。** automation ID `6adb18502ca08191b0b05f436915aee4`，状态 enabled；最近运行2026-11-24T23:15Z开始、23:19Z完成，下一次计划2026-11-25T05:15:00Z（北京时间13:15）。本次没有修改其prompt、排程或启停状态。
7. 工作流配置保持原样：`cloud-operations.yml` 仍按05:15/11:15/17:15/23:15 UTC及13:35 UTC排程；`run-pinterest-publisher.yml` 仍为每小时第17分钟；`replenish-stock.yml` 仍只由手动dispatch或batch/脚本路径变更触发，本区间没有batch因此没有触发补货工作流。Supabase云端发布调度、GitHub云端库存报告配置、已有首次缺口跟进状态和既有修复安排均未修改。

## 六、本次执行边界与日报文件

- 只读业务核验；没有触发Pinterest发布、Etsy补货、入队、修复、重置发布历史或更改发布/补货/跟进任务。
- 没有使用用户电脑、桌面浏览器会话、本地路径、Codex进程或heartbeat；没有要求配置OpenAI/Etsy API key。
- 没有创建本地任务；没有停用用户本地日报ID10；没有停用长期日报或补货自动化。
- 完整日报与机器可读证据保存于：
  - [daily-report-2026-11-25.md](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-25.md)
  - [daily-report-2026-11-25.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-25.json)
  - [cloud-daily-report-state.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-daily-report-state.json)
- 本日报同时投递至 [GitHub Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2)。逻辑截止只在完整日报文件保存、评论成功并回读验证后写入状态文件。