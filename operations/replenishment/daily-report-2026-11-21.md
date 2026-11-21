# 执行日报 2026-11-21
<!-- store-promotion-daily:2026-11-21 -->

本区间真实新增 **9 个 Pin、7 条补货素材**。两批首次 inserted 分别 **6、1**，失败均 **0**，实际幂等重跑均 **inserted=0**；7 条新增队列在新 Verify 中均为 **ready / snapshot_matches=true**。核验时有效库存 **77**，按每路线 target=3 计算缺口 **19**。P3 不确定发布和晚间报告失败仍未解决。

## 区间与证据覆盖

- 北京时间：**2026-11-20 10:00（含）—2026-11-21 10:00（不含）**；UTC：2026-11-20T02:00:00Z—2026-11-21T02:00:00Z。承接状态文件中上次成功截止，同日标记检查未发现既有日报。
- 本次通过 GitHub 连接器确认访问，读取 main **431fdcbcafb5c36fd5e4c8f3991e93e865b5b303** 的证据目录、区间两批 batch、四份 cloud-run、首次跟进状态、云端运营文档、发布/补货/Verify 工作流及实际业务 job 日志；读取 Issue #2 和全部 **162 条评论**。按标题搜索找到[发布复核 Issue #3](https://github.com/Sailin09/Store-Promotion/issues/3)，其历史快照未作为当日基线。
- 截止后仅重跑最新只读 Verify：[run 44781516830 / job 136689784704](https://github.com/Sailin09/Store-Promotion/actions/runs/44781516830/job/136689784704)。数据库数据时间 **2026-11-21 10:00:20.178873 北京时间**，比逻辑截止晚 **20.179 秒**；实际证据核对时间 **10:01:05**，延迟 **1 分 5 秒**。本轮在截止前开始准备，最终统计使用截止后的新日志。
- 发布计数使用真实 published_at，按唯一 Pin ID 去重；新日志的 daily_history 查询覆盖本区间且没有 LIMIT，与逐账号 publication 明细交叉一致，共9条。队列新增按 created_at 与唯一 queue_id 统计；两批入库日志和数据库记录相符。未用累计62或历史116作每日基线。
- 已读取区间全部10个工作流运行的业务 job；运行列表第一页100条已追溯至11月12日，覆盖本区间。发布与补货记录覆盖完整；调度查询仅最近10条 cron、20条 HTTP，**不能证明区间全部调度请求均成功，调度逐次覆盖不完整**。

## 逐账号发布与待处理

下表待处理为核验时点值，不是本区间新增量；ready/scheduled 来自全部已审核队列，不等于均可立即发布。

| 账号 / handle | 区间真实新增 Pin | 已审核 ready/scheduled | paused/failed | draft |
|---|---:|---:|---:|---:|
| P1 / icyndizhang | 3 | 52 | 0 | 55 |
| P2 / sailing_981 | 3 | 12 | 0 | 26 |
| P3 / mydecorshop | 0 | 6 | 1 | 4 |
| P4 / cindyzhang62 | 2 | 4 | 0 | 0 |
| P5 / ivy5205 | 1 | 3 | 0 | 0 |

P3 的 **0** 已由完整区间历史确认，不是“未确认”。全部可核实新增如下；发布时间保留数据库原始 UTC 值：

| 账号 | 店铺 | Etsy 商品 | Pin 链接 | published_at（UTC） |
|---|---|---|---|---|
| P1 | CustomCurtainsStudio | [4429547648](https://www.etsy.com/listing/4429547648) | [801218590009923941](https://www.pinterest.com/pin/801218590009923941/) | 2026-11-20T02:05:02.737749+00:00 |
| P2 | WoodHomeLiang | [1770022046](https://www.etsy.com/listing/1770022046) | [863494928599694562](https://www.pinterest.com/pin/863494928599694562/) | 2026-11-20T02:10:02.437445+00:00 |
| P5 | NngGoods | [4537618827](https://www.etsy.com/listing/4537618827) | [713820609738063641](https://www.pinterest.com/pin/713820609738063641/) | 2026-11-20T02:35:01.986339+00:00 |
| P1 | DanyHomeDesign | [1891220452](https://www.etsy.com/listing/1891220452) | [801218590009930112](https://www.pinterest.com/pin/801218590009930112/) | 2026-11-20T13:00:04.713281+00:00 |
| P2 | MiawoodStudio | [1851918955](https://www.etsy.com/listing/1851918955) | [863494928599699975](https://www.pinterest.com/pin/863494928599699975/) | 2026-11-20T13:05:03.066657+00:00 |
| P4 | PearlsTreasuresArt | [1898664669](https://www.etsy.com/listing/1898664669) | [675399275415006077](https://www.pinterest.com/pin/675399275415006077/) | 2026-11-20T13:45:02.548325+00:00 |
| P1 | FrenchStyleDecor | [4578917184](https://www.etsy.com/listing/4578917184) | [801218590009938004](https://www.pinterest.com/pin/801218590009938004/) | 2026-11-21T00:00:05.139304+00:00 |
| P2 | LambertHouse | [4546244084](https://www.etsy.com/listing/4546244084) | [863494928599708139](https://www.pinterest.com/pin/863494928599708139/) | 2026-11-21T00:05:02.614925+00:00 |
| P4 | QuGifts | [4438028232](https://www.etsy.com/listing/4438028232) | [675399275415014442](https://www.pinterest.com/pin/675399275415014442/) | 2026-11-21T00:45:01.940917+00:00 |

未发布、失败与原因：

- **P3 / Chtte**：listing [4616101190](https://www.etsy.com/listing/4616101190)，queue_id **35c31472-0b55-4f6d-bd70-eb336463ee80**，queue_status=paused，attempt_state=uncertain，error=pin_response_503，Pin ID与发布历史均为空。attempt_id **c6bd08a5-afc4-495c-a309-8482d88efefb**；结果仍不确定，不计新增、不自动重试。
- P3 的 CellaHo、LoomGoStudio 各3条 reserve_item 均 eligible_configuration=false；SQL 为组合门槛，日志不足以逐项确认全部原因。不能把6条ready视为可立即发布。P3 最近真实发布仍为 **2026-11-13T02:50:04.240759Z**。
- P1 的 Chtte 两条 reserve_item 同样 eligible_configuration=false，保留跨账号店铺间隔及不确定尝试门槛。其余未发布素材仍受账号/店铺间隔、窗口、审核和防重复规则约束。
- draft 中 P1 的55条、P2的26条均无图片；P3的4条有3条带图。它们仍是草稿，不计已审核有效库存或成功发布。
- 区间三个手动入口发布工作流的实际日志均为 outside_publish_window、published=0：[03:18运行](https://github.com/Sailin09/Store-Promotion/actions/runs/44666880500/job/136058210531)、[12:56运行](https://github.com/Sailin09/Store-Promotion/actions/runs/44739914649/job/136300672000)、[21:07运行](https://github.com/Sailin09/Store-Promotion/actions/runs/44817456739/job/136569352624)。这些绿色工作流不计作新增Pin；上表9条来自数据库真实发布历史。

## 区间真实新增补货素材

全部7条 created_at 在本区间；以下状态取自新 Verify。Board沿用已有核验映射。

| 序号 | shop / Etsy 商品 | account / handle | Board 名称 / ID | queue_id | queue_status / snapshot_matches |
|---|---|---|---|---|---|
| 1 | CustomCurtainsStudio · [4318913374](https://www.etsy.com/listing/4318913374/beige-grid-sheer-curtain-panel-farmhouse) | P1 / icyndizhang | CyndiZhangStudio / 801218658646993070 | f522389b-1d01-4a56-b00b-fc9f5df53845 | ready / true |
| 2 | NngGoods · [4392506041](https://www.etsy.com/listing/4392506041/rose-quartz-crystal-cabinet-knob-brass) | P5 / ivy5205 | Furniture / 713820678377803412 | 8e101628-c4ec-4360-a1cd-a421c43037dc | ready / true |
| 3 | QuGifts · [4315235013](https://www.etsy.com/listing/4315235013/natural-shell-wine-stopper-coastal-beach) | P4 / cindyzhang62 | Decor / 675399344056772225 | b3f5991f-8b0b-4ea2-839b-d6f455788a48 | ready / true |
| 4 | WoodHomeLiang · [1753118426](https://www.etsy.com/listing/1753118426/camphor-wood-suit-hangers-wide-shoulder) | P2 / sailing_981 | storage / 863494997243989843 | f1af8c3a-9dfd-48fe-8227-25c0f76af27e | ready / true |
| 5 | ChicDecorHK · [4450232183](https://www.etsy.com/listing/4450232183/minimalist-linen-blend-curtain-black) | P1 / icyndizhang | CyndiZhangStudio / 801218658646993070 | e234a457-dfe1-4030-a07e-910d7b3d8dff | ready / true |
| 6 | Adamideal · [4484587271](https://www.etsy.com/listing/4484587271/dovetail-cherry-wood-cable-management) | P2 / sailing_981 | storage / 863494997243989843 | b7d86ad2-813a-4cb3-be48-e58d081191de | ready / true |
| 7 | DanyHomeDesign · [4363667019](https://www.etsy.com/listing/4363667019/white-sheer-curtainswillow-leaf-light) | P1 / icyndizhang | CyndiZhangStudio / 801218658646993070 | c441fe02-3d50-45b0-8a66-7e94cc8a6e14 | ready / true |

| 序号 | 实际入库 created_at（UTC） | 来源 / 实际视觉核验时间 checked_at（UTC） |
|---|---|---|
| 1 | 2026-11-20T05:27:17.138289+00:00 | 2026-11-20T05:24:19.438Z |
| 2 | 2026-11-20T05:27:20.599694+00:00 | 2026-11-20T05:24:19.602Z |
| 3 | 2026-11-20T05:27:22.560224+00:00 | 2026-11-20T05:24:19.799Z |
| 4 | 2026-11-20T05:27:27.560656+00:00 | 2026-11-20T05:24:19.978Z |
| 5 | 2026-11-20T05:27:28.711752+00:00 | 2026-11-20T05:24:20.186Z |
| 6 | 2026-11-20T05:27:29.604651+00:00 | 2026-11-20T05:25:09.926Z |
| 7 | 2026-11-20T17:15:14.833629+00:00 | 2026-11-20T17:13:31.110Z |

- **1—6 / 批次A**：从当时登记店铺 storefront 发现，先排除该轮前置新日志中的 **565个 known_listing_ids**，再进入真实详情核验卖家、在售选项及主 Add to cart，并通过远程CDP实际查看各商品原主图截图。WoodHomeLiang 的按钮在变体更新后于 **05:25:17.970 UTC** 再确认启用；视觉时间仍为原05:24:19.978。完整原图URL、选项、文案及逐条具体证据见[批次A](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261120-052509.json)和[运行记录A](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261120-052509.json)。
- **7 / 批次B**：从 DanyHomeDesign 当前 Sheer Curtains 分区发现，排除 **571个已知ID**；真实卖家匹配，审核选项为 **1 PCS-W39XL51 inch、Rod Pocket、quantity 1**，主 Add to cart 启用。实际主图为浅色窗纱、竖向叶片图案及窄条带，束在窗边；见[批次B](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261120-171331.json)和[运行记录B](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261120-171331.json)。
- 本日报仅读取上述历史视觉证据，未重新审核商品、未刷新 checked_at。两批原始证据均 visual_verified=true；新数据库再次确认7条 source_matches=true、snapshot_matches=true。WoodHomeLiang 主图展示3个衣架，实际审核选项为1件，文案已明确；不把主图陈列数当购买数量。

| 批次 | 首次 inserted | failed | 实际 retry inserted | run / job |
|---|---:|---:|---:|---|
| A · batch-20261120-052509 | 6 | 0 | 0 | [44681011023 / 136104265391](https://github.com/Sailin09/Store-Promotion/actions/runs/44681011023/job/136104265391) |
| B · batch-20261120-171331 | 1 | 0 | 0 | [44781317165 / 136444621410](https://github.com/Sailin09/Store-Promotion/actions/runs/44781317165/job/136444621410) |

两份实际job日志均含首次逐条插入与随后的 Verify idempotent retry inserted=0；未发现重复新增queue事件。独立 Verify 自动触发并在本次再次只读重跑。本日报没有重跑补货工作流。

未入库候选，全部不计成功：

- HibiChStudio：**4420842205、4454344966、4559057618、4559038359、4559062406、4559684799、4420844641、4473116090、4473114318、4420839477、4517906376、4517885823、4454347860**，当前卡片为其他收纳袋/箱/衣物罩，不符合 Wall & Door Organizers；未宣称详情或视觉通过。
- MiawoodStudio：[1669452239](https://www.etsy.com/listing/1669452239) 为亚克力衣架，不符合 Wooden Hangers。
- DanyHomeDesign：**4363673358、4363661179、4443451424、4471737292、4471259460、4471246080**，本批只缺1条，其他候选未做详情及视觉核验，未入库。
- Chtte当前14个ID、ChicDecorHK贝壳首饰22个、NinaJiaStudio24个、PearlsTreasuresArt31个唯一ID均已知；未重复入队。无新增筛查见[11时记录](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261120-112028.json)和[23时记录](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261120-231317.json)。

## 核验时点各路线库存与缺口

数据库时点 **2026-11-21T02:00:20.178873Z**，32条有效映射路线，统一 **target=3**；当前库存与区间新增7条分开统计。原SQL与云端库存Issue仍使用历史target=7，本日报只按新usable重算，未改脚本或映射。

| 店铺 | 账号 | usable | 缺口 |
|---|---|---:|---:|
| ChicDecorHK | P4 | 0 | 3 |
| Chtte | P3 | 0 | 3 |
| HibiChStudio | P2 | 0 | 3 |
| NinaJiaStudio | P5 | 0 | 3 |
| MiawoodStudio | P2 | 1 | 2 |
| Chtte | P1 | 2 | 1 |
| FrenchStyleDecor | P1 | 2 | 1 |
| LambertHouse | P2 | 2 | 1 |
| PearlsTreasuresArt | P4 | 2 | 1 |
| QuGifts | P4 | 2 | 1 |
| Adamideal | P2 | 3 | 0 |
| AmyHomeCrafts | P1 | 3 | 0 |
| beou | P1 | 3 | 0 |
| CellaHo | P3 | 3 | 0 |
| ChicDecorHK | P1 | 3 | 0 |
| CustomCurtainsStudio | P1 | 3 | 0 |
| DanyHomeDesign | P1 | 3 | 0 |
| GavinHome | P1 | 3 | 0 |
| HeyDream | P1 | 3 | 0 |
| KoltCraftStudio | P2 | 3 | 0 |
| KorusStore | P1 | 3 | 0 |
| LoomGoStudio | P3 | 3 | 0 |
| MiraKiuStudio | P1 | 3 | 0 |
| NiceCraftStudioHK | P1 | 3 | 0 |
| NngGoods | P5 | 3 | 0 |
| Parkermo | P1 | 3 | 0 |
| ShirieHomeShow | P1 | 3 | 0 |
| SobiaStudio | P1 | 3 | 0 |
| StellaGoodsGifts | P1 | 3 | 0 |
| TunaMunStudio | P1 | 3 | 0 |
| WOGOL | P1 | 3 | 0 |
| WoodHomeLiang | P2 | 3 | 0 |
| **合计** | **32条路线** | **77** | **19** |

## 异常、修复与首次跟进

- P3 uncertain / pin_response_503、paused队列与不满足可发布门槛的问题仍存在，未解决、未清空历史、未重试结果不确定的发布。
- [晚间 Cloud promotion operations run44820518921 / job136580111867](https://github.com/Sailin09/Store-Promotion/actions/runs/44820518921/job/136580111867) 于 **2026-11-20 21:28:30 UTC** 在 cloud-report.mjs 步骤输出 Cloud report failed，退出码1；根因未确认。
- 后续[23时库存报告 job136626267738](https://github.com/Sailin09/Store-Promotion/actions/runs/44834123103/job/136626267738)确实更新Issue #2，但属于另一次执行，不能据此认定晚间错误已修复。其target=7缺口144不与本日报target=3缺口19混用。
- 区间补货失败0；没有可证实的新增代码修复。发布cron核验为 **active=true、*/5 * * * ***；最近HTTP200 idle不是成功发布证据。
- first-deficit-followup.json 原状态 **completed**，历史首轮2条、实际重跑0条；本日报未修改或重新宣称首次完成。长期补货、现有发布/复核和已有修复安排均保持原样。

## 截止后事件与投递

截至数据时间，没有检出 published_at ≥ 2026-11-21T02:00:00Z 的新增Pin，也没有检出截止后的新增补货queue。**02:00:00.092290 UTC** 的调度HTTP请求尚未完成，属于截止后待处理事件，不计本区间成功；后续结果留给下一份日报。

本轮仅执行只读核验与日报文件、评论及状态写入，没有触发发布、补货、入队、修复或修改任何任务。完整正文保存至 [daily-report-2026-11-21.md](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-21.md)，配套证据为 [daily-report-2026-11-21.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-21.json)；本聊天与Issue #2使用同一正文。
