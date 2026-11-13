# 执行日报 2026-11-13

<!-- store-promotion-daily:2026-11-13 -->

**本期实际发布 12 条唯一 Pin，补货实际入库 12 条。** 核验时，32 条有效路线共有 **81 条可用素材、15 条缺口**，每条目标 3。库存对账：81 + 12 − 12 = 81。

统计区间：北京时间 **11 月 12 日 10:00（含）至 11 月 13 日 10:00（不含）**，即 UTC 11 月 12 日 02:00 至 11 月 13 日 02:00，续接[上一份成功日报](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-6812227241)。[只读数据库核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43267467172/job/131635068281)的数据时点为北京时间 **2026-11-13 10:00:15.443**（UTC `2026-11-13T02:00:15.443531+00:00`），比逻辑截止晚 **15.443 秒**；核验作业于北京时间 11-13 10:00:18 完成。下文时间均为北京时间，表内显示到秒，归期使用原始时间。

**Pinterest 实际发布**

P1 `@icyndizhang` **3** 条；P2 `@sailing_981` **3** 条；P3 `@mydecorshop` **2** 条；P4 `@cindyzhang62` **3** 条；P5 `@ivy5205` **1** 条。数据库发布历史覆盖整个区间，按真实 `published_at` 与唯一 Pin ID 计数，并核对商品和店铺。

| 账号 | 实际发布时间 | 店铺 / Etsy 商品 | Pin |
|---|---|---|---|
| P1 | 11-12 10:05:02 | FrenchStyleDecor [4296817061](https://www.etsy.com/listing/4296817061) | [801218590009784827](https://www.pinterest.com/pin/801218590009784827/) |
| P2 | 11-12 10:10:02 | LambertHouse [4574288059](https://www.etsy.com/listing/4574288059) | [863494928599566927](https://www.pinterest.com/pin/863494928599566927/) |
| P3 | 11-12 10:45:02 | LoomGoStudio [4474242681](https://www.etsy.com/listing/4474242681) | [499618152434375017](https://www.pinterest.com/pin/499618152434375017/) |
| P4 | 11-12 10:55:02 | PearlsTreasuresArt [1885304220](https://www.etsy.com/listing/1885304220) | [675399275414875701](https://www.pinterest.com/pin/675399275414875701/) |
| P1 | 11-12 21:00:06 | Parkermo [1555653880](https://www.etsy.com/listing/1555653880) | [801218590009791238](https://www.pinterest.com/pin/801218590009791238/) |
| P2 | 11-12 21:05:02 | MiawoodStudio [1433295652](https://www.etsy.com/listing/1433295652) | [863494928599573667](https://www.pinterest.com/pin/863494928599573667/) |
| P4 | 11-12 21:55:01 | QuGifts [4348895208](https://www.etsy.com/listing/4348895208) | [675399275414881333](https://www.pinterest.com/pin/675399275414881333/) |
| P1 | 11-13 08:00:05 | KorusStore [1857527976](https://www.etsy.com/listing/1857527976) | [801218590009799915](https://www.pinterest.com/pin/801218590009799915/) |
| P2 | 11-13 08:05:02 | Adamideal [4523363026](https://www.etsy.com/listing/4523363026) | [863494928599582093](https://www.pinterest.com/pin/863494928599582093/) |
| P3 | 11-13 08:45:05 | CellaHo [1839194772](https://www.etsy.com/listing/1839194772) | [499618152434381176](https://www.pinterest.com/pin/499618152434381176/) |
| P4 | 11-13 08:50:02 | ChicDecorHK [4356476861](https://www.etsy.com/listing/4356476861) | [675399275414889155](https://www.pinterest.com/pin/675399275414889155/) |
| P5 | 11-13 09:55:02 | NngGoods [4613758846](https://www.etsy.com/listing/4613758846) | [713820609737942526](https://www.pinterest.com/pin/713820609737942526/) |

**Etsy 实际补货**

- 第一批：[入库及实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/43160866904/job/130991593697)，首次 `inserted=9`、`failed=0`，重跑 `inserted=0`。[入库后核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43160998065/job/130991880023) · [详情和主图证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261112-051725.json)。
- 第二批：[入库及实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/43267266327/job/131354382763)，首次 `inserted=3`、`failed=0`，重跑 `inserted=0`。[入库后核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43267467172/job/131354792979) · [详情和主图证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261112-171200.json)。

两批商品 ID 和 `queue_id` 均唯一。入库后核验时，12 条均为 `ready` 且 `snapshot_matches=true`。下表最后一列为本次日报核验时的状态和快照结果；12 条的来源和 Board 均与批次一致。 Etsy 商品链接为来源页，主图核验时间链接至实际查看的原图；对应运行证据记录了详情卖家、可售选项、购物车按钮及截图所见。

| 店铺 / Etsy 商品 | 账号 | Board / ID | queue_id | 实际主图核验 | 实际入库 | 当前状态 / 快照一致 |
|---|---|---|---|---|---|---|
| CellaHo [4362240382](https://www.etsy.com/listing/4362240382/apricot-beige-cotton-eyelet-embroidery) | P3 `@mydecorshop` | Home Decor `499618221101238533` | `1e6a0425-35bf-46d8-8e9d-22601d5ced0a` | [11-12 13:19:53](https://i.etsystatic.com/39663062/r/il/4b1af8/7210383971/il_794xN.7210383971_c99f.jpg) | 11-12 13:22:22 | ready / true |
| ChicDecorHK [1585132122](https://www.etsy.com/listing/1585132122/natural-white-seashell-constellation) | P4 `@cindyzhang62` | Jewelry & Accessories `675399344058025061` | `8236f932-7aac-476e-8415-1063929a12c5` | [11-12 13:20:38](https://i.etsystatic.com/32003756/r/il/7d5974/5601766471/il_794xN.5601766471_nmoj.jpg) | 11-12 13:22:25 | ready / true |
| CustomCurtainsStudio [4615365890](https://www.etsy.com/listing/4615365890/handmade-crochet-lace-door-curtain) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `b1d3a28e-e90a-4994-b1b5-e36c6692cdbd` | [11-12 13:19:32](https://i.etsystatic.com/38873964/r/il/407d35/8890019751/il_794xN.8890019751_f6r7.jpg) | 11-12 13:22:28 | ready / true |
| FrenchStyleDecor [4586340988](https://www.etsy.com/listing/4586340988/cotton-embroidered-half-apron-floral) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `d7fd43f6-b70b-477d-bbd5-eb5330f4bb4a` | [11-12 13:20:16](https://i.etsystatic.com/33874695/r/il/1bc0e1/8610717360/il_794xN.8610717360_mhg6.jpg) | 11-12 13:22:29 | ready / true |
| KoltCraftStudio [4360184975](https://www.etsy.com/listing/4360184975/walnut-wood-desktop-organizer-vintage) | P2 `@sailing_981` | storage `863494997243989843` | `49059fe5-1f7f-4753-863d-613984961a4e` | [11-12 13:19:35](https://i.etsystatic.com/43671795/r/il/d7d676/7199655125/il_794xN.7199655125_2jkr.jpg) | 11-12 13:22:34 | ready / true |
| LambertHouse [4573217770](https://www.etsy.com/listing/4573217770/304-stainless-steel-clothes-hanger-1020) | P2 `@sailing_981` | storage `863494997243989843` | `b0d5371f-931f-4183-9c18-15c4568ab507` | [11-12 13:19:37](https://i.etsystatic.com/46944744/r/il/0d7e69/8854898969/il_794xN.8854898969_chsd.jpg) | 11-12 13:22:36 | ready / true |
| LoomGoStudio [4442565893](https://www.etsy.com/listing/4442565893/silk-organza-embroidered-fabric-chinese) | P3 `@mydecorshop` | Home Decor `499618221101238533` | `9e318ee5-d821-4616-b411-6b924be8236a` | [11-12 13:20:14](https://i.etsystatic.com/58959935/r/il/02402f/7611212480/il_794xN.7611212480_o3ly.jpg) | 11-12 13:22:37 | ready / true |
| NngGoods [4582982364](https://www.etsy.com/listing/4582982364/natural-gemstone-drawer-pull-brass) | P5 `@ivy5205` | Furniture `713820678377803412` | `494aea56-57fc-4632-b8e0-61737ede3edf` | [11-12 13:20:18](https://i.etsystatic.com/57194200/r/il/eaf8aa/8829604394/il_794xN.8829604394_rhod.jpg) | 11-12 13:22:40 | ready / true |
| PearlsTreasuresArt [1836837324](https://www.etsy.com/listing/1836837324/gold-seashell-drop-earrings-rhinestone) | P4 `@cindyzhang62` | Jewelry & Accessories `675399344058025061` | `09b1198a-09dc-4c70-a213-67f750165e6e` | [11-12 13:19:59](https://i.etsystatic.com/46725934/r/il/d7fae3/6688975994/il_794xN.6688975994_7d7f.jpg) | 11-12 13:22:41 | ready / true |
| MiawoodStudio [1877285269](https://www.etsy.com/listing/1877285269/black-wooden-pants-hanger-with-silver) | P2 `@sailing_981` | storage `863494997243989843` | `650054be-4e3e-4442-b979-cff055257b18` | [11-13 01:13:23](https://i.etsystatic.com/32100253/r/il/e0f025/6659936416/il_794xN.6659936416_qnxp.jpg) | 11-13 01:15:06 | ready / true |
| Parkermo [4501357371](https://www.etsy.com/listing/4501357371/plaid-tier-curtain-sheer-cafe-valance) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `829d8385-efba-466b-8f4e-82b57fa4b817` | [11-13 01:13:29](https://i.etsystatic.com/41687571/r/il/74b578/8088569266/il_794xN.8088569266_3yef.jpg) | 11-13 01:15:08 | ready / true |
| QuGifts [4398996286](https://www.etsy.com/listing/4398996286/coastal-curtain-tiebacks-handmade-shell) | P4 `@cindyzhang62` | Decor `675399344056772225` | `e287e1b0-9d21-41d6-85cc-10913e62b359` | [11-13 01:13:35](https://i.etsystatic.com/38006525/r/il/a94e91/7359081586/il_794xN.7359081586_ijdn.jpg) | 11-13 01:15:14 | ready / true |

**未入库候选：** [11 月 12 日 19:12 检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261112-111235.json)和[11 月 13 日 07:14 检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261112-231414.json)均未提交批次。Chtte 的 13 个、NinaJiaStudio 的 24 个可见 ID 均已知；HibiChStudio 有 8 个已知挂式收纳商品，另 13 个未知 ID 属收纳箱、篮、袋或衣罩，不符合既有 Wall & Door Organizers 分类。这 13 个 ID 不重复计数，未入库，也未计作主图核验。

**各路线库存（核验时点，每条目标 3）**

| 账号 | 可用 3、缺口 0 的路线 | 其他路线（可用 / 缺口） | 合计可用 / 缺口 |
|---|---|---|---|
| P1 | AmyHomeCrafts、beou、ChicDecorHK、CustomCurtainsStudio、DanyHomeDesign、FrenchStyleDecor、GavinHome、HeyDream、MiraKiuStudio、NiceCraftStudioHK、Parkermo、ShirieHomeShow、SobiaStudio、StellaGoodsGifts、TunaMunStudio、WOGOL | Chtte 2/1、KorusStore 2/1 | 52 / 2 |
| P2 | KoltCraftStudio、LambertHouse、MiawoodStudio、WoodHomeLiang | Adamideal 2/1、HibiChStudio 0/3 | 14 / 4 |
| P3 | LoomGoStudio | CellaHo 2/1、Chtte 0/3 | 5 / 4 |
| P4 | PearlsTreasuresArt、QuGifts | ChicDecorHK 2/1 | 8 / 1 |
| P5 | — | NinaJiaStudio 0/3、NngGoods 2/1 | 2 / 4 |
| 合计 | 23 条 | 9 条有缺口 | **81 / 15** |

库存 SQL 和云端库存评论按目标 7 输出；上表使用同一份查询的 `usable` 按目标 3 计算。

**未发布、失败与待处理**

- 五个账号均启用且 OAuth 已连接。数据库发布调度启用。有 81 条可用素材待现有调度；逐条未来发布时间未确认。另有草稿 85 条（P1 55、P2 26、P3 4、P4 0、P5 0），其中 3 条带图，草稿不计可用库存。核验时未见未完成或异常的发布尝试，也未见暂停或失败的队列。
- 11 月 12 日晚间窗口 P3、P5 无实际 Pin，逐次未发布原因未确认。三个 GitHub 发布作业记录 `idle / outside_publish_window`：[11 月 12 日 11:01](https://github.com/Sailin09/Store-Promotion/actions/runs/43145356765/job/130941766350)、[19:16](https://github.com/Sailin09/Store-Promotion/actions/runs/43207689571/job/131146910173)、[11 月 13 日 02:58](https://github.com/Sailin09/Store-Promotion/actions/runs/43285398011/job/131417350955)；[11 月 13 日 08:27](https://github.com/Sailin09/Store-Promotion/actions/runs/43337218435/job/131596326036) 的作业记录 `idle`，未给原因。四次均为 `published=0`。
- [晚间报告作业](https://github.com/Sailin09/Store-Promotion/actions/runs/43306181376/job/131490159941)于 **11 月 13 日 05:02:43** 在生成报告步骤退出码 1，已保留 [artifact](https://github.com/Sailin09/Store-Promotion/actions/runs/43306181376/artifacts/13983043147)，日志未给出根因。[PR #8](https://github.com/Sailin09/Store-Promotion/pull/8) 已合入，但晚间报告恢复仍未确认。[后续库存报告](https://github.com/Sailin09/Store-Promotion/actions/runs/43322559819/job/131546944154)正常，并有 [Issue #2 库存评论](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-6837990841)；这不证明晚间报告已恢复。
- 两批补货均无入库失败，幂等重跑无重复写入。首次缺口跟进仍为 [`completed`](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json)。本次仅重跑只读核验并记录日报，没有触发发布、补货或修复，也未修改业务任务。

**截止后事件（不计入本期）**

截至 11-13 10:00:15，未见截止后新增 Pin。

截至本次核验未见截止后入库证据。截止后发起的调度请求 `1252`（11-13 10:00:00） 尚无完成结果，不计发布。

**证据覆盖与投递**

本次通过 GitHub 连接器读取最新 main、区间两份批次、四份运行记录及 Issue #2 的 119 条既有评论，并按标题找到[历史发布复核 Issue](https://github.com/Sailin09/Store-Promotion/issues/3)。历史累计值未作本期基线。发布历史覆盖完整区间；12 条入库有逐条作业日志及队列证据，未见第三批入库证据。调度日志每次最多保留 10 条 cron 和 20 条 HTTP 请求，**全区间瞬时错误和逐次未发布原因覆盖不完整**；核验查询无法排除审核队列以外的写入。

[Markdown 归档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-13.md) · [JSON 证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-13.json)。同一正文用于本云端任务聊天和 [GitHub Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2) 当日唯一日报评论；设备通知送达未独立核验。