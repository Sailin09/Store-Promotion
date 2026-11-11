# 执行日报 2026-11-11

<!-- store-promotion-daily:2026-11-11 -->

**本期实际发布 13 条唯一 Pin，补货实际入库 12 条。** 截至核验时点，32 条有效路线共有 **81 条可用素材、15 条缺口**，每条目标 3。与上期库存对账：82 + 12 − 13 = 81。

统计区间为北京时间 **11 月 10 日 10:00（含）至 11 月 11 日 10:00（不含）**，即 UTC 11 月 10 日 02:00 至 11 月 11 日 02:00。起点续接[上一份成功日报](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-6756832884)。[只读数据库核验](https://github.com/Sailin09/Store-Promotion/actions/runs/42864359464/job/130269037554)的审计时点为 **11 月 11 日 10:01:05.920382（02:01:05.920382 UTC）**，较逻辑截止晚 **65.920 秒**；核验作业 10:01:08 完成。下表为北京时间，显示到秒，归期按数据库原始时间。

**Pinterest 实际发布**

P1 `@icyndizhang` **3** 条；P2 `@sailing_981` **3** 条；P3 `@mydecorshop` **2** 条；P4 `@cindyzhang62` **3** 条；P5 `@ivy5205` **2** 条。数据库发布历史覆盖全区间，按真实 `published_at` 和唯一 Pin ID 计数，再与队列和商品记录关联。

| 账号 | 发布时间 | 店铺 / Etsy 商品 | Pin |
|---|---|---|---|
| P1 | 11-10 10:05:02 | AmyHomeCrafts [4549672978](https://www.etsy.com/listing/4549672978) | [801218590009749700](https://www.pinterest.com/pin/801218590009749700/) |
| P2 | 11-10 10:10:02 | Adamideal [4363561859](https://www.etsy.com/listing/4363561859) | [863494928599533808](https://www.pinterest.com/pin/863494928599533808/) |
| P3 | 11-10 10:35:02 | LoomGoStudio [4573015594](https://www.etsy.com/listing/4573015594) | [499618152434362210](https://www.pinterest.com/pin/499618152434362210/) |
| P4 | 11-10 10:45:02 | PearlsTreasuresArt [4397640177](https://www.etsy.com/listing/4397640177) | [675399275414843051](https://www.pinterest.com/pin/675399275414843051/) |
| P1 | 11-10 21:00:05 | StellaGoodsGifts [4579450601](https://www.etsy.com/listing/4579450601) | [801218590009757506](https://www.pinterest.com/pin/801218590009757506/) |
| P2 | 11-10 21:05:02 | MiawoodStudio [1863115354](https://www.etsy.com/listing/1863115354) | [863494928599540755](https://www.pinterest.com/pin/863494928599540755/) |
| P4 | 11-10 21:45:02 | QuGifts [4338882015](https://www.etsy.com/listing/4338882015) | [675399275414849669](https://www.pinterest.com/pin/675399275414849669/) |
| P5 | 11-10 22:45:02 | NinaJiaStudio [4415229681](https://www.etsy.com/listing/4415229681) | [713820609737898236](https://www.pinterest.com/pin/713820609737898236/) |
| P1 | 11-11 08:00:03 | TunaMunStudio [4548402554](https://www.etsy.com/listing/4548402554) | [801218590009766784](https://www.pinterest.com/pin/801218590009766784/) |
| P2 | 11-11 08:05:02 | LambertHouse [4548317332](https://www.etsy.com/listing/4548317332) | [863494928599549005](https://www.pinterest.com/pin/863494928599549005/) |
| P3 | 11-11 08:35:02 | CellaHo [4395693763](https://www.etsy.com/listing/4395693763) | [499618152434368054](https://www.pinterest.com/pin/499618152434368054/) |
| P4 | 11-11 08:40:02 | ChicDecorHK [1267359860](https://www.etsy.com/listing/1267359860) | [675399275414858187](https://www.pinterest.com/pin/675399275414858187/) |
| P5 | 11-11 09:45:02 | NngGoods [4392501130](https://www.etsy.com/listing/4392501130) | [713820609737906864](https://www.pinterest.com/pin/713820609737906864/) |

**Etsy 实际补货**

- [第一批入库与实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/42761237042/job/129647291953)：首次 `inserted=9`、`failed=0`，重跑 `inserted=0`。[入库后核验](https://github.com/Sailin09/Store-Promotion/actions/runs/42761339269/job/129647478801) · [现场核验证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261110-051340.json)。
- [第二批入库与实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/42864163473/job/129998144591)：首次 `inserted=3`、`failed=0`，重跑 `inserted=0`。[入库后核验](https://github.com/Sailin09/Store-Promotion/actions/runs/42864359464/job/129998595079) · [现场核验证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261110-171757.json)。

以下 12 个 `queue_id` 和商品 ID 均唯一；本次数据库复核全部为 **`ready`、`snapshot_matches=true`**，来源和 Board 均与批次相符。商品链接为 Etsy 来源页；主图核验时间链接到当时查看的原图。两份现场证据记录了卖家、在售选项、Add to cart 与截图所见。

| 店铺 / Etsy 商品 | 账号 | Board / ID | queue_id | 主图核验 | 实际入库 |
|---|---|---|---|---|---|
| Adamideal [4486320024](https://www.etsy.com/listing/4486320024/walnut-wood-ipad-stand-solid-desk-tablet) | P2 `@sailing_981` | storage `863494997243989843` | `1a6af81e-84cc-4129-9223-d5bbcb1c8c09` | [11-10 13:15:16](https://i.etsystatic.com/35172699/r/il/88ff68/7897142426/il_794xN.7897142426_s167.jpg) | 11-10 13:18:32 |
| AmyHomeCrafts [1481500391](https://www.etsy.com/listing/1481500391/vintage-white-embroidered-curtain-cotton) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `b9cae892-9595-4d1e-a861-96066e19ee28` | [11-10 13:16:59](https://i.etsystatic.com/40547461/r/il/7fe54f/8162462357/il_794xN.8162462357_to3r.jpg) | 11-10 13:18:34 |
| CellaHo [1839194772](https://www.etsy.com/listing/1839194772/embroidered-floral-cotton-linen-fabric) | P3 `@mydecorshop` | Home Decor `499618221101238533` | `8a1b5ff5-fd51-40ed-ba88-256142be4087` | [11-10 13:15:44](https://i.etsystatic.com/39663062/r/il/9340de/6542933394/il_794xN.6542933394_oy94.jpg) | 11-10 13:18:35 |
| ChicDecorHK [4356476861](https://www.etsy.com/listing/4356476861/seashell-pearl-dangle-earring-boho-beach) | P4 `@cindyzhang62` | Jewelry & Accessories `675399344058025061` | `ee1a4745-c764-4950-bd01-b614664bd3f5` | [11-10 13:15:53](https://i.etsystatic.com/32003756/r/il/fd0d68/7187819847/il_794xN.7187819847_dtkt.jpg) | 11-10 13:18:36 |
| GavinHome [1408573323](https://www.etsy.com/listing/1408573323/white-embroidered-sheer-curtain-romantic) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `b6181924-7312-46f0-898d-e215066b8317` | [11-10 13:15:56](https://i.etsystatic.com/36377996/r/il/0380cb/5376705611/il_794xN.5376705611_6014.jpg) | 11-10 13:18:37 |
| LoomGoStudio [4442578680](https://www.etsy.com/listing/4442578680/silk-organza-embroidered-fabric-crane) | P3 `@mydecorshop` | Home Decor `499618221101238533` | `c3f2376a-0f2d-4044-82c7-2cf2f9cd2dd5` | [11-10 13:16:06](https://i.etsystatic.com/58959935/r/il/59f1ef/7611248380/il_794xN.7611248380_mvxw.jpg) | 11-10 13:18:38 |
| NngGoods [4613758846](https://www.etsy.com/listing/4613758846/white-howlite-brass-cabinet-knobs-drawer) | P5 `@ivy5205` | Furniture `713820678377803412` | `9a2ced32-6776-424e-9a44-8fa66b757b0b` | [11-10 13:16:20](https://i.etsystatic.com/57194200/r/il/76836b/8876951261/il_794xN.8876951261_6nnr.jpg) | 11-10 13:18:40 |
| PearlsTreasuresArt [4348862803](https://www.etsy.com/listing/4348862803/white-seashell-statement-ring-adjustable) | P4 `@cindyzhang62` | Jewelry & Accessories `675399344058025061` | `27d0dad6-a6e1-4e65-a3c7-6ebd0181452c` | [11-10 13:17:09](https://i.etsystatic.com/46725934/r/il/d32220/7093270766/il_794xN.7093270766_t3ab.jpg) | 11-10 13:18:41 |
| WoodHomeLiang [4608807527](https://www.etsy.com/listing/4608807527/camphor-wood-drawer-organizer-10-or-15) | P2 `@sailing_981` | storage `863494997243989843` | `b2268c82-2e2c-4982-91a0-739d5e62528b` | [11-10 13:16:38](https://i.etsystatic.com/38928671/r/il/164a9d/8836899559/il_794xN.8836899559_dqcr.jpg) | 11-10 13:18:41 |
| MiawoodStudio [1784400328](https://www.etsy.com/listing/1784400328/engraved-walnut-wedding-hanger-with) | P2 `@sailing_981` | storage `863494997243989843` | `e1c6845e-f544-4c93-8866-28b9e3ae75a7` | [11-11 01:20:48](https://i.etsystatic.com/32100253/r/il/c0236c/6292468112/il_794xN.6292468112_lvb9.jpg) | 11-11 01:22:36 |
| QuGifts [1906061961](https://www.etsy.com/listing/1906061961/handmade-seashell-flower-ball-coastal) | P4 `@cindyzhang62` | Decor `675399344056772225` | `81c9bbc6-386b-49f5-83ac-135b874667ca` | [11-11 01:20:35](https://i.etsystatic.com/38006525/r/il/2d049f/6806429166/il_794xN.6806429166_pokm.jpg) | 11-11 01:22:38 |
| StellaGoodsGifts [4557913906](https://www.etsy.com/listing/4557913906/green-velvet-lumbar-pillow-cover) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `62e6b746-7d69-44b7-b524-39df45a5d501` | [11-11 01:20:58](https://i.etsystatic.com/54217402/r/il/ad303c/8554445426/il_794xN.8554445426_r6dw.jpg) | 11-11 01:22:41 |

**未入库候选：** [11 月 10 日 19:17 左右检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261110-111719.json)和[11 月 11 日 07:11 检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261110-231106.json)均未提交批次。Chtte 的 13 个、NinaJiaStudio 的 24 个可见 ID 均已知；HibiChStudio 的 8 个符合既有路线的商品均已知，其余 13 个未知 ID 是收纳箱、袋或衣罩，不符合已核准的 Wall & Door Organizers 分类。两轮所见的同一批未知 ID 不重复计数，未入库；店面筛查不计作主图核验。

**各路线库存（核验时点，每条目标 3）**

| 账号 | 达标路线（各 3 可用 / 0 缺口） | 未达标路线（可用 / 缺口） | 合计可用 / 缺口 |
|---|---|---|---|
| P1 | AmyHomeCrafts、beou、ChicDecorHK、CustomCurtainsStudio、DanyHomeDesign、FrenchStyleDecor、GavinHome、HeyDream、KorusStore、MiraKiuStudio、NiceCraftStudioHK、Parkermo、ShirieHomeShow、SobiaStudio、StellaGoodsGifts、WOGOL | Chtte 2/1、TunaMunStudio 2/1 | 52 / 2 |
| P2 | Adamideal、KoltCraftStudio、MiawoodStudio、WoodHomeLiang | HibiChStudio 0/3、LambertHouse 2/1 | 14 / 4 |
| P3 | LoomGoStudio | Chtte 0/3、CellaHo 2/1 | 5 / 4 |
| P4 | PearlsTreasuresArt、QuGifts | ChicDecorHK 2/1 | 8 / 1 |
| P5 | — | NinaJiaStudio 0/3、NngGoods 2/1 | 2 / 4 |
| 合计 | 23 条达标路线 | 9 条有缺口 | **81 / 15** |

库存 SQL 日志按目标 7 输出；本日报用同一份新查询的 `usable` 按目标 3 计算，未修改配置。Chtte P3、HibiChStudio P2、NinaJiaStudio P5 仍为零库存。

**未发布、失败与待处理**

- 五账号均启用且 OAuth 已连接，现有五分钟调度处于启用状态，发布窗口为北京时间 08:00–11:00、21:00–23:00，账号最小间隔 2 小时，另有店铺限频。81 条可用素材待既有调度，逐条未来发布时间未确认。另有草稿 85 条：P1 55、P2 26、P3 4、P4 0、P5 0；仅 P3 有 3 条带图草稿，草稿不计可用库存。
- 数据库核验时未见未完成发布尝试或处于暂停/失败的队列。区间内三个 GitHub 发布作业都记录为 `idle / outside_publish_window`、`published=0`：[11 月 10 日 17:52](https://github.com/Sailin09/Store-Promotion/actions/runs/42794386602/job/129755670968)、[11 月 11 日 01:52](https://github.com/Sailin09/Store-Promotion/actions/runs/42869302840/job/130015948628)、[11 月 11 日 07:24](https://github.com/Sailin09/Store-Promotion/actions/runs/42923091428/job/130202575447)；这些作业不计入实际发布。
- [晚间报告作业](https://github.com/Sailin09/Store-Promotion/actions/runs/42896649326/job/130111626285)于 **11 月 11 日 04:35:17** 在报告步骤退出码 1，无 artifact，根因未确认。[后续库存报告](https://github.com/Sailin09/Store-Promotion/actions/runs/42913950264/job/130171625618)于 06:23 更新了 Issue #2，只能确认库存报告成功；晚间报告的修复或恢复仍未确认。区间内未见脚本或工作流修复提交。
- 两批补货均无入库失败或重复写入。首次缺口跟进保持 [`completed`](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json)。本次仅重跑只读 Verify 并写日报、证据和续接状态；未触发发布或补货，也未更改现有任务。

**截止后事件（不计入本期）**

截至 10:01:05 的审计，未见截止后新增 Pin 或可核实的补货入库。调度请求 `1132` 于 10:00:00 发起，核验日志未提供其完成时间或结果，不计发布。

**证据覆盖与投递**

本次通过 GitHub 连接器读取最新 main、区间内两份批次、四份补货运行证据及 Issue #2 全部 108 条既有评论；按标题找到[历史发布复核 Issue](https://github.com/Sailin09/Store-Promotion/issues/3)，其累计数据不作本期基线。发布历史查询覆盖整个区间；12 条补货由逐条入库日志和数据库队列对账。调度日志只保留最近 10 条 cron 和 20 条 HTTP 请求，**全区间瞬时错误和逐次未发布原因覆盖不完整**；核验查询也不能排除审核队列之外的写入，未见第三批补货入库证据。

[Markdown 归档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-11.md) · [JSON 证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-11.json)。本正文用于云端任务聊天与 [GitHub Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2) 当日唯一日报评论；设备通知送达未独立核验。
