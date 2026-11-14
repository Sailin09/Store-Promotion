# 执行日报 2026-11-14

<!-- store-promotion-daily:2026-11-14 -->

**本期实际发布 9 条唯一 Pin，补货实际入库 11 条。** 入库后复核时 11 条均为 `ready`；日报核验时 10 条仍为 `ready`，Chtte P3 有 1 条因发布结果未确认而暂停。核验时 32 条有效路线共有 **81 条可用素材、15 条缺口**，每条目标 3。

统计区间：北京时间 **11 月 13 日 10:00（含）至 11 月 14 日 10:00（不含）**，即 UTC 11 月 13 日 02:00 至 11 月 14 日 02:00，续接[上一份成功日报](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-6841581873)。[只读数据库核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43471588081/job/132290977888)的数据时间为北京时间 **11 月 14 日 10:02:58.817**（UTC `2026-11-14T02:02:58.816729+00:00`），比逻辑截止晚 **2 分 58.817 秒**；作业日志于 **10:03:00** 结束。下文均为北京时间，表中显示到秒，归期使用原始时间。

**Pinterest 实际发布**

P1 `@icyndizhang` **3** 条；P2 `@sailing_981` **3** 条；P3 `@mydecorshop` **1** 条；P4 `@cindyzhang62` **2** 条；P5 `@ivy5205` **0** 条（区间内已确认，截止后另有 1 条）。按数据库 `published_at` 和唯一 Pin ID 计数。

| 账号 | 实际发布时间 | 店铺 / Etsy 商品 | Pin |
|---|---|---|---|
| P1 | 11-13 10:05:02 | SobiaStudio [4310547220](https://www.etsy.com/listing/4310547220) | [801218590009801481](https://www.pinterest.com/pin/801218590009801481/) |
| P2 | 11-13 10:10:02 | KoltCraftStudio [1747883774](https://www.etsy.com/listing/1747883774) | [863494928599583079](https://www.pinterest.com/pin/863494928599583079/) |
| P3 | 11-13 10:50:04 | LoomGoStudio [4442578680](https://www.etsy.com/listing/4442578680) | [499618152434381758](https://www.pinterest.com/pin/499618152434381758/) |
| P1 | 11-13 21:00:05 | MiraKiuStudio [4465201641](https://www.etsy.com/listing/4465201641) | [801218590009808066](https://www.pinterest.com/pin/801218590009808066/) |
| P2 | 11-13 21:05:02 | WoodHomeLiang [1677664863](https://www.etsy.com/listing/1677664863) | [863494928599588919](https://www.pinterest.com/pin/863494928599588919/) |
| P4 | 11-13 21:10:02 | PearlsTreasuresArt [4348862803](https://www.etsy.com/listing/4348862803) | [675399275414896415](https://www.pinterest.com/pin/675399275414896415/) |
| P1 | 11-14 08:00:05 | ShirieHomeShow [4366227478](https://www.etsy.com/listing/4366227478) | [801218590009816259](https://www.pinterest.com/pin/801218590009816259/) |
| P2 | 11-14 08:05:02 | LambertHouse [4573171313](https://www.etsy.com/listing/4573171313) | [863494928599597140](https://www.pinterest.com/pin/863494928599597140/) |
| P4 | 11-14 08:10:02 | QuGifts [1906061961](https://www.etsy.com/listing/1906061961) | [675399275414904423](https://www.pinterest.com/pin/675399275414904423/) |

**Etsy 实际补货**

- 第一批：[入库及实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/43371571264/job/131708423666)，首次 `inserted=8`、`failed=0`，重跑 `inserted=0`。[入库后核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43371675082/job/131708618836) · [详情及主图证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261113-052200.json)。
- 第二批：[入库及实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/43471442332/job/132044306168)，首次 `inserted=3`、`failed=0`，重跑 `inserted=0`。[入库后核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43471588081/job/132044588249) · [详情及主图证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261113-171808.json)。

11 条商品 ID 和 `queue_id` 均唯一。入库后 11 条均为 `ready`、`snapshot_matches=true`，来源和 Board 均与批次相符。Etsy 链接为核验来源页；主图核验时间链接到实际查看的原图。运行证据记录了详情卖家、在售选项、购物车按钮及截图所见。最后一列为日报核验时的队列状态和快照结果；Chtte 的来源及 Board 一致性有入库后证据，本次 `ready/scheduled` 库存明细不包含其暂停行。

| 店铺 / Etsy 商品 | 账号 | Board / ID | queue_id | 实际主图核验 | 实际入库 | 当前状态 / 快照一致 |
|---|---|---|---|---|---|---|
| Chtte [4616101190](https://www.etsy.com/listing/4616101190/chair-cushion-set-cotton-linen-seat-pad) | P3 `@mydecorshop` | Kitchen & Dining `499618221101215211` | `35c31472-0b55-4f6d-bd70-eb336463ee80` | [11-13 13:21:11](https://i.etsystatic.com/58205190/r/il/e42b52/8896131759/il_794xN.8896131759_cn8d.jpg) | 11-13 13:22:51 | paused / true |
| Adamideal [4449935263](https://www.etsy.com/listing/4449935263/desktop-wooden-cable-organizer-box-power) | P2 `@sailing_981` | storage `863494997243989843` | `5debfa48-5ab8-4db3-bb7b-1bf38d141dd1` | [11-13 13:21:01](https://i.etsystatic.com/35172699/r/il/10ace0/7894327270/il_794xN.7894327270_2uhy.jpg) | 11-13 13:22:55 | ready / true |
| CellaHo [4362868081](https://www.etsy.com/listing/4362868081/embroidered-cotton-fabric-off-white) | P3 `@mydecorshop` | Home Decor `499618221101238533` | `a2db8dd7-8683-4e3d-8f2d-3b966c4d7a6a` | [11-13 13:20:51](https://i.etsystatic.com/39663062/r/il/c7ed5d/7213946973/il_794xN.7213946973_dvi8.jpg) | 11-13 13:22:56 | ready / true |
| KoltCraftStudio [1769937480](https://www.etsy.com/listing/1769937480/solid-wood-pants-hangers-with-adjustable) | P2 `@sailing_981` | storage `863494997243989843` | `33596452-4f2a-4df2-acea-902ef1af99dd` | [11-13 13:20:51](https://i.etsystatic.com/43671795/r/il/789a9a/6271822891/il_794xN.6271822891_htqo.jpg) | 11-13 13:22:56 | ready / true |
| KorusStore [1623541470](https://www.etsy.com/listing/1623541470/custom-green-floral-curtains-botanical) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `db289c41-d178-4e4a-8fad-1717eeda045a` | [11-13 13:20:51](https://i.etsystatic.com/35854701/r/il/c35e1b/6709610404/il_794xN.6709610404_bcvi.jpg) | 11-13 13:22:58 | ready / true |
| LoomGoStudio [4364584865](https://www.etsy.com/listing/4364584865/embroidered-organza-fabric-oriental) | P3 `@mydecorshop` | Home Decor `499618221101238533` | `e07d4588-dfa3-4b9a-8c77-e5776d9e1c9a` | [11-13 13:20:52](https://i.etsystatic.com/58959935/r/il/118f29/7222537357/il_794xN.7222537357_eglf.jpg) | 11-13 13:22:58 | ready / true |
| NngGoods [4585514605](https://www.etsy.com/listing/4585514605/natural-stone-brass-cabinet-knobs-white) | P5 `@ivy5205` | Furniture `713820678377803412` | `5464eef2-5556-418f-88df-807192fbc8e7` | [11-13 13:21:01](https://i.etsystatic.com/57194200/r/il/8313c5/8829702236/il_794xN.8829702236_73l5.jpg) | 11-13 13:22:59 | ready / true |
| SobiaStudio [4425775629](https://www.etsy.com/listing/4425775629/rose-floral-curtains-semi-blackout) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `1eddc049-9a60-4135-b697-8db3ba45e57d` | [11-13 13:21:01](https://i.etsystatic.com/42208273/r/il/70bb6c/7569494181/il_794xN.7569494181_qzl0.jpg) | 11-13 13:22:59 | ready / true |
| MiraKiuStudio [4535984109](https://www.etsy.com/listing/4535984109/white-cotton-half-apron-with-pockets) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `f35f473d-097b-423c-b0bb-094fe6a876f6` | [11-14 01:17:33](https://i.etsystatic.com/59152881/r/il/8902bc/8847648873/il_794xN.8847648873_db8d.jpg) | 11-14 01:18:52 | ready / true |
| PearlsTreasuresArt [1890266206](https://www.etsy.com/listing/1890266206/seashell-earrings-rhinestone-silver) | P4 `@cindyzhang62` | Jewelry & Accessories `675399344058025061` | `2dc05e81-7834-42ae-b434-290a4f217754` | [11-14 01:17:33](https://i.etsystatic.com/46725934/r/il/571f78/6798293790/il_794xN.6798293790_bjge.jpg) | 11-14 01:18:54 | ready / true |
| WoodHomeLiang [1784017080](https://www.etsy.com/listing/1784017080/beech-wood-hanger-with-pants-bar-closet) | P2 `@sailing_981` | storage `863494997243989843` | `d5f49399-f2b7-4468-b745-5e4d35fb83dd` | [11-14 01:17:33](https://i.etsystatic.com/38928671/r/il/7e7bb6/6347949914/il_794xN.6347949914_2uot.jpg) | 11-14 01:18:57 | ready / true |

**未入库候选：** [11 月 13 日 19:15 检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261113-111543.json)和[11 月 14 日 07:17 检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261113-231709.json)均未提交批次。Chtte 的 14 个、NinaJiaStudio 的 24 个、ChicDecorHK 贝壳首饰专区的 22 个可见 ID 均已知。HibiChStudio 有 8 个已知挂式收纳商品，另 13 个未入库 ID 属收纳箱、篮、袋或衣罩，不符合既有 Wall & Door Organizers 分类。这 13 个 ID 不重复计数，未计为详情或主图核验。第二批所查的另外三家店各补足 1 条；其余可见未知 ID 未逐件核验，也未计入入库。

**各路线库存（核验时点，每条目标 3）**

| 账号 | 可用 3、缺口 0 的路线 | 其他路线（可用 / 缺口） | 合计可用 / 缺口 |
|---|---|---|---|
| P1 | AmyHomeCrafts、beou、ChicDecorHK、CustomCurtainsStudio、DanyHomeDesign、FrenchStyleDecor、GavinHome、HeyDream、KorusStore、MiraKiuStudio、NiceCraftStudioHK、Parkermo、SobiaStudio、StellaGoodsGifts、TunaMunStudio、WOGOL | Chtte 2/1、ShirieHomeShow 2/1 | 52 / 2 |
| P2 | Adamideal、KoltCraftStudio、MiawoodStudio、WoodHomeLiang | HibiChStudio 0/3、LambertHouse 2/1 | 14 / 4 |
| P3 | CellaHo、LoomGoStudio | Chtte 0/3 | 6 / 3 |
| P4 | PearlsTreasuresArt | ChicDecorHK 2/1、QuGifts 2/1 | 7 / 2 |
| P5 | — | NinaJiaStudio 0/3、NngGoods 2/1 | 2 / 4 |
| 合计 | 23 条 | 9 条有缺口 | **81 / 15** |

库存 SQL 和独立库存评论按目标 7 输出；上表用同一次核验的 `usable` 按目标 3 计算。库存对账：上一核验 81 + 本期入库 11 − 本期发布 9 − 暂停 1 − 截止后发布 1 = 核验时点 81。

**未发布、失败与待处理**

- **Chtte P3：** [11 月 13 日 13:23 入库后核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43371675082/job/131708618836)时为 `ready`；[11 月 14 日 01:15 核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43371675082/job/132042319187)已显示 `paused / uncertain`。日报核验仍为同一状态，尝试 ID `c6bd08a5-afc4-495c-a309-8482d88efefb`，错误 `pin_response_503`，没有 Pin ID 或已发布历史。确切尝试时间和 Pinterest 端最终结果未确认，不计发布，也未重试或重置。
- 五个账号均启用且 OAuth 已连接，数据库发布调度启用。81 条可用素材等待现有调度；逐条未来发布时间未确认。另有草稿 85 条（P1 55、P2 26、P3 4、P4 0、P5 0），其中 3 条带图，不计可用库存。除上述 Chtte 行外，核验未见其他未完成的发布尝试或暂停、失败的队列。
- 11 月 13 日晚间窗口 P3、P5 没有已确认发布；除 Chtte 的异常尝试，逐次未发布原因未确认。区间三次 GitHub 发布作业均记录 `idle / outside_publish_window`、`published=0`：[11 月 13 日 16:00](https://github.com/Sailin09/Store-Promotion/actions/runs/43389769092/job/131766637316)、[11 月 14 日 00:26](https://github.com/Sailin09/Store-Promotion/actions/runs/43462787608/job/132013817937)、[06:39](https://github.com/Sailin09/Store-Promotion/actions/runs/43521023658/job/132215008913)。这些作业不计业务发布。
- [晚间报告作业](https://github.com/Sailin09/Store-Promotion/actions/runs/43503326056/job/132154672605)于 **11 月 14 日 04:38:40** 在生成报告步骤退出码 1，日志未给根因，[artifact](https://github.com/Sailin09/Store-Promotion/actions/runs/43503326056/artifacts/14075456149)已保留。[PR #8](https://github.com/Sailin09/Store-Promotion/pull/8) 已合入，但晚间报告仍未恢复；[06:38 库存报告](https://github.com/Sailin09/Store-Promotion/actions/runs/43520802342/job/132214429576)更新了 [Issue #2 库存评论](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-6866676458)，不代表晚间报告已修复。
- 两批补货没有入库失败或幂等重复写入。首次缺口跟进保持 [`completed`](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json)。本日报只重跑只读核验并记录结果，未触发发布、补货或修复，也未更改业务任务。

**截止后事件（不计入本期）**

- 11 月 14 日 **10:00:02.806**，P5 `@ivy5205` 实际发布 NngGoods [4594927622](https://www.etsy.com/listing/4594927622)，[Pin 713820609737960243](https://www.pinterest.com/pin/713820609737960243/)。该 Pin 已消耗核验时点库存。
- 截至 10:02:58.817 未见截止后入库证据。10:00 发起的请求 `1312` 在调度日志尚无完成结果；已发布 Pin 以独立历史为准，未将两者推定为同一事件。

**证据覆盖与投递**

本次通过 GitHub 连接器读取最新 main、区间两份批次、四份补货运行证据和 Issue #2 的 125 条既有评论，并按标题找到[历史发布复核 Issue](https://github.com/Sailin09/Store-Promotion/issues/3)。发布历史查询覆盖整个区间；11 条入库有逐条作业日志和数据库队列证据，未见第三批入库。调度采样最多保留最近 10 条 cron 和 20 条 HTTP 请求，**全区间瞬时错误及逐次未发布原因覆盖不完整**；入库查询无法排除审核队列以外的写入。

[Markdown 归档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-14.md) · [JSON 证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-14.json) · [GitHub Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2)。同一正文用于 GitHub 当日唯一日报评论和本云端任务聊天；设备通知送达未独立核验。
