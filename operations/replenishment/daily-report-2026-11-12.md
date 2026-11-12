# 执行日报 2026-11-12

<!-- store-promotion-daily:2026-11-12 -->

**本期实际发布 12 条唯一 Pin，补货实际入库 12 条。** 核验时，32 条有效路线共有 **81 条可用素材、15 条缺口**，每条目标 3。库存与上期对账：81 + 12 − 12 = 81。

统计区间为北京时间 **11 月 11 日 10:00（含）至 11 月 12 日 10:00（不含）**，即 UTC 11 月 11 日 02:00 至 11 月 12 日 02:00。起点续接[上一份成功日报](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-6784837005)。[只读数据库核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43066710870/job/130919552215)的数据时点为 **2026-11-12 10:01:59.087 北京时间**（UTC 02:01:59.087937），较截止晚 **119.088 秒**；核验作业北京时间 10:02:03 完成。下表均为北京时间，显示到秒，归期使用数据库原始时间。

**Pinterest 实际发布**

P1 `@icyndizhang` **3** 条；P2 `@sailing_981` **3** 条；P3 `@mydecorshop` **2** 条；P4 `@cindyzhang62` **3** 条；P5 `@ivy5205` **1** 条。发布历史查询覆盖整个区间，以真实 `published_at` 和唯一 Pin ID 计数，并与商品、队列和店铺对账。

| 账号 | 实际发布时间 | 店铺 / Etsy 商品 | Pin |
|---|---|---|---|
| P1 | 11-11 10:05:03 | beou [4389140030](https://www.etsy.com/listing/4389140030) | [801218590009768074](https://www.pinterest.com/pin/801218590009768074/) |
| P2 | 11-11 10:10:02 | WoodHomeLiang [1766739011](https://www.etsy.com/listing/1766739011) | [863494928599550435](https://www.pinterest.com/pin/863494928599550435/) |
| P3 | 11-11 10:40:02 | LoomGoStudio [4574322861](https://www.etsy.com/listing/4574322861) | [499618152434368592](https://www.pinterest.com/pin/499618152434368592/) |
| P4 | 11-11 10:50:02 | PearlsTreasuresArt [4397633965](https://www.etsy.com/listing/4397633965) | [675399275414859753](https://www.pinterest.com/pin/675399275414859753/) |
| P1 | 11-11 21:00:03 | HeyDream [4559770507](https://www.etsy.com/listing/4559770507) | [801218590009774508](https://www.pinterest.com/pin/801218590009774508/) |
| P2 | 11-11 21:05:02 | Adamideal [4525422475](https://www.etsy.com/listing/4525422475) | [863494928599556983](https://www.pinterest.com/pin/863494928599556983/) |
| P4 | 11-11 21:50:03 | QuGifts [4338887493](https://www.etsy.com/listing/4338887493) | [675399275414865095](https://www.pinterest.com/pin/675399275414865095/) |
| P1 | 11-12 08:00:03 | CustomCurtainsStudio [4544256338](https://www.etsy.com/listing/4544256338) | [801218590009783677](https://www.pinterest.com/pin/801218590009783677/) |
| P2 | 11-12 08:05:02 | KoltCraftStudio [1754831599](https://www.etsy.com/listing/1754831599) | [863494928599565342](https://www.pinterest.com/pin/863494928599565342/) |
| P3 | 11-12 08:40:03 | CellaHo [4478515901](https://www.etsy.com/listing/4478515901) | [499618152434374431](https://www.pinterest.com/pin/499618152434374431/) |
| P4 | 11-12 08:45:02 | ChicDecorHK [1869942090](https://www.etsy.com/listing/1869942090) | [675399275414874317](https://www.pinterest.com/pin/675399275414874317/) |
| P5 | 11-12 09:50:02 | NngGoods [4537641050](https://www.etsy.com/listing/4537641050) | [713820609737924534](https://www.pinterest.com/pin/713820609737924534/) |

**Etsy 实际补货**

- 第一批：[入库与同作业重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/42964631338/job/130338997734)，首次 `inserted=9`、`failed=0`，重跑 `inserted=0`。[入库后核验](https://github.com/Sailin09/Store-Promotion/actions/runs/42964732778/job/130339188078) · [详情与主图核验证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261111-051211.json)。
- 第二批：[入库与同作业重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/43066582234/job/130683226560)，首次 `inserted=3`、`failed=0`，重跑 `inserted=0`。[入库后核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43066710870/job/130683490643) · [详情与主图核验证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261111-171433.json)。

以下商品 ID 和 `queue_id` 均唯一。本次数据库回读逐条确认 **`queue_status=ready`、`snapshot_matches=true`**，来源和 Board 均与批次相符。商品链接是 Etsy 来源页；主图核验时间链接到当时查看的原图。现场证据记录了实际卖家、在售选项、Add to cart 和云端截图所见。

| 店铺 / Etsy 商品 | 账号 | Board / ID | queue_id | 主图核验 | 实际入库 |
|---|---|---|---|---|---|
| beou [4513492864](https://www.etsy.com/listing/4513492864/round-ramie-seat-cushion-non-slip-linen) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `de98d182-69c9-4cfd-9b35-b5b772a70b80` | [11-11 13:13:35](https://i.etsystatic.com/31778838/r/il/730f59/8076918038/il_794xN.8076918038_syq3.jpg) | 11-11 13:16:40 |
| CellaHo [4366152963](https://www.etsy.com/listing/4366152963/floral-jacquard-embroidered-fabric-cream) | P3 `@mydecorshop` | Home Decor `499618221101238533` | `65e1c154-defa-4840-bd3b-7d27387b925b` | [11-11 13:14:38](https://i.etsystatic.com/39663062/r/il/42e770/7182547388/il_794xN.7182547388_k91y.jpg) | 11-11 13:16:42 |
| ChicDecorHK [1664536978](https://www.etsy.com/listing/1664536978/handcrafted-freshwater-pearl-necklace) | P4 `@cindyzhang62` | Jewelry & Accessories `675399344058025061` | `aee73021-1975-4b46-a119-8b7a84ab5abf` | [11-11 13:15:09](https://i.etsystatic.com/32003756/r/il/caff8b/5819107477/il_794xN.5819107477_9ius.jpg) | 11-11 13:16:43 |
| LambertHouse [4574351627](https://www.etsy.com/listing/4574351627/stainless-steel-clothes-hanger-wide) | P2 `@sailing_981` | storage `863494997243989843` | `b4de54f3-fb31-46e5-96c2-bf36c56c793f` | [11-11 13:13:45](https://i.etsystatic.com/46944744/r/il/6d777a/8516444436/il_794xN.8516444436_11lr.jpg) | 11-11 13:16:47 |
| LoomGoStudio [4474248818](https://www.etsy.com/listing/4474248818/embroidered-organza-fabric-by-yard) | P3 `@mydecorshop` | Home Decor `499618221101238533` | `14a9fd4c-2759-4fc1-9bac-73f85932a9f6` | [11-11 13:13:51](https://i.etsystatic.com/58959935/r/il/ddd514/7868173065/il_794xN.7868173065_evrd.jpg) | 11-11 13:16:47 |
| NngGoods [4594927622](https://www.etsy.com/listing/4594927622/natural-stone-cabinet-knobs-round-marble) | P5 `@ivy5205` | Furniture `713820678377803412` | `673ed248-2be0-4bab-9226-c7b188be6499` | [11-11 13:14:04](https://i.etsystatic.com/57194200/r/il/96a4d7/8876880961/il_794xN.8876880961_6r4c.jpg) | 11-11 13:16:49 |
| PearlsTreasuresArt [4515043853](https://www.etsy.com/listing/4515043853/natural-shell-earrings-mother-of-pearl) | P4 `@cindyzhang62` | Jewelry & Accessories `675399344058025061` | `f7407f75-28c7-40ec-84a8-46892a453904` | [11-11 13:14:48](https://i.etsystatic.com/46725934/r/il/b082b6/8087859082/il_794xN.8087859082_fj6c.jpg) | 11-11 13:16:49 |
| TunaMunStudio [4532871582](https://www.etsy.com/listing/4532871582/linen-textured-cafe-curtain-macrame) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `9fea53ab-7471-42af-a362-a6275fee66af` | [11-11 13:14:10](https://i.etsystatic.com/60242016/r/il/a69f45/8277509045/il_794xN.8277509045_i5hs.jpg) | 11-11 13:16:50 |
| WoodHomeLiang [1608285528](https://www.etsy.com/listing/1608285528/handcrafted-ash-wood-coat-hangers-non) | P2 `@sailing_981` | storage `863494997243989843` | `0054594a-20e0-40e2-badb-c99114e86d46` | [11-11 13:14:16](https://i.etsystatic.com/38928671/r/il/c4a193/5551616120/il_794xN.5551616120_hven.jpg) | 11-11 13:16:50 |
| Adamideal [4423854894](https://www.etsy.com/listing/4423854894/wood-wine-rack-curved-wooden-bottle) | P2 `@sailing_981` | storage `863494997243989843` | `bf6fcef8-99a3-4ba6-9c36-e05adca4085c` | [11-12 01:15:53](https://i.etsystatic.com/35172699/r/il/7e0579/8883861113/il_794xN.8883861113_lf2k.jpg) | 11-12 01:17:20 |
| HeyDream [1812173937](https://www.etsy.com/listing/1812173937/mixed-pattern-sheer-curtain-geometric) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `f6ad0640-0803-440a-a129-2eb4c581b070` | [11-12 01:15:59](https://i.etsystatic.com/35422134/r/il/7293a1/8190625176/il_794xN.8190625176_dmd6.jpg) | 11-12 01:17:22 |
| QuGifts [4363646198](https://www.etsy.com/listing/4363646198/handmade-shell-wall-hanging-boho-coastal) | P4 `@cindyzhang62` | Decor `675399344056772225` | `13ffd87b-8eee-462d-95a7-242284ef0e1f` | [11-12 01:16:04](https://i.etsystatic.com/38006525/r/il/cb1c39/7169825970/il_794xN.7169825970_j6w7.jpg) | 11-12 01:17:23 |

**未入库候选：** [11 月 11 日 19:19 检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261111-111949.json)和[11 月 12 日 07:15 检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261111-231557.json)均未提交批次。Chtte 的 13 个、NinaJiaStudio 的 24 个可见 ID 均已知。HibiChStudio 的 8 个符合现有路线的 ID 均已知；另 13 个未知 ID 为收纳箱、篮、袋或衣罩，未通过既有 Wall & Door Organizers 分类筛查。两次所见的同一批未知 ID 不重复计数，均未入库，也未计作主图核验。

**各路线库存（核验时点，每条目标 3）**

| 账号 | 达标路线（各 3 可用 / 0 缺口） | 未达标路线（可用 / 缺口） | 合计可用 / 缺口 |
|---|---|---|---|
| P1 | AmyHomeCrafts、beou、ChicDecorHK、DanyHomeDesign、FrenchStyleDecor、GavinHome、HeyDream、KorusStore、MiraKiuStudio、NiceCraftStudioHK、Parkermo、ShirieHomeShow、SobiaStudio、StellaGoodsGifts、TunaMunStudio、WOGOL | Chtte 2/1、CustomCurtainsStudio 2/1 | 52 / 2 |
| P2 | Adamideal、LambertHouse、MiawoodStudio、WoodHomeLiang | HibiChStudio 0/3、KoltCraftStudio 2/1 | 14 / 4 |
| P3 | LoomGoStudio | CellaHo 2/1、Chtte 0/3 | 5 / 4 |
| P4 | PearlsTreasuresArt、QuGifts | ChicDecorHK 2/1 | 8 / 1 |
| P5 | — | NinaJiaStudio 0/3、NngGoods 2/1 | 2 / 4 |
| 合计 | 23 条达标路线 | 9 条有缺口 | **81 / 15** |

核验日志的库存 SQL 和旧库存通知按目标 7 输出；本表使用同次查询的 `usable` 按目标 3 计算。Chtte P3、HibiChStudio P2、NinaJiaStudio P5 仍为零库存。

**未发布、失败与待处理**

- 五账号均启用且 OAuth 已连接。五分钟发布调度处于启用状态，发布窗口为北京时间 08:00–11:00、21:00–23:00，账号最小间隔 2 小时，并有店铺限频。81 条可用素材待既有调度；逐条未来发布时间未确认。另有草稿 85 条：P1 55、P2 26、P3 4、P4 0、P5 0；带图的 3 条均属 P3，草稿不计可用库存。
- 11 月 11 日晚间窗口，P3、P5 无实际 Pin；逐次未发布原因未确认。核验时未见未完成的发布尝试或暂停、失败的队列。区间内三个 GitHub 发布作业在[11 月 11 日 14:25](https://github.com/Sailin09/Store-Promotion/actions/runs/42972360356/job/130363532077)、[23:14](https://github.com/Sailin09/Store-Promotion/actions/runs/43046342856/job/130611174175)、[11 月 12 日 05:59](https://github.com/Sailin09/Store-Promotion/actions/runs/43107900506/job/130815952213)均记录 `idle / outside_publish_window`，不计发布。
- [晚间报告修复 PR #8](https://github.com/Sailin09/Store-Promotion/pull/8) 已合入 main：调整北京时间快照日期，缺快照时改为带说明的实时报告。区间内的[晚间报告运行](https://github.com/Sailin09/Store-Promotion/actions/runs/43096035309)仍排队，无 job 或 artifact，实际恢复及数据库快照修复生效未确认；[11 月 12 日 07:28 库存报告](https://github.com/Sailin09/Store-Promotion/actions/runs/43120006110/job/130857931797)已更新 Issue #2，该作业只证明库存报告运行成功。
- 两批补货均无入库失败或重复写入。首次缺口跟进保持 [`completed`](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json)。本次只重跑只读 Verify，业务记录与各任务未改动。

**截止后事件（不计入本期）**

截至北京时间 10:01:59 的数据库核验，未见截止后新增 Pin 或有证据的入库。请求 `1192` 于 10:00:00 发起，核验时尚无完成结果，不计发布。

**证据覆盖与投递**

通过 GitHub 连接器读取最新 main、两份区间批次、四份补货运行记录及 Issue #2 全部 114 条既有评论；按标题找到[历史发布复核 Issue](https://github.com/Sailin09/Store-Promotion/issues/3)，其累计值未用于本期。发布历史覆盖完整区间；12 条入库与逐条作业日志、数据库队列及库存变动一致。调度日志每次仅保留最近 10 条 cron 和 20 条 HTTP 请求，**全区间瞬时错误及逐次未发布原因覆盖不完整**；入库核验也无法排除审核队列之外的写入，未见第三批入库证据。

[Markdown 归档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-12.md) · [JSON 证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-12.json)。本正文用于云端任务聊天与 [GitHub Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2) 当日唯一日报评论；设备通知送达未独立核验。