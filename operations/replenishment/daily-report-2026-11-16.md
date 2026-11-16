# 执行日报 2026-11-16
<!-- store-promotion-daily:2026-11-16 -->

Sailin09/Store-Promotion｜**确认发布 10 条 Pin，确认补货入库 9 条。** 两批幂等重跑均新增 0 条；核验时可用库存 **81 / 96**，8 条路线合计缺 **15** 条。P3 区间确认 0 条，历史 503 仍待确认；独立晚间报告本期仍失败。

**区间与证据。** 北京时间 **2026-11-15 10:00（含）至 2026-11-16 10:00（不含）**，即 UTC `[2026-11-15T02:00:00Z, 2026-11-16T02:00:00Z)`。起点续接[上次成功日报](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-6887667285)。本次通过 GitHub 连接器核对了 [main](https://github.com/Sailin09/Store-Promotion/tree/0260bf73779d8d29720d94e8fdbc01f871825b70)、[Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2) 的两页 135 条既有评论，以及按标题找到的[发布复核 Issue](https://github.com/Sailin09/Store-Promotion/issues/3)。在北京时间 11-16 10:03 发起只读重跑；[新 Verify Supabase Data](https://github.com/Sailin09/Store-Promotion/actions/runs/43740559387/job/133045513884) 的数据库审计时间为 **11-16 10:03:43.586**（UTC 02:03:43.586），比逻辑截止晚 **3 分 43.586 秒**。下表时间均为北京时间。发布历史查询覆盖整个区间，并与五账号发布记录交叉核对；调度与 HTTP 日志只保留最近 10 和 20 条，逐次尝试及未发布原因的全区间覆盖不完整。

**Pinterest 实际发布。** 按真实 `published_at` 筛选并以 Pin ID 去重。P1 3 条、P2 3 条、P3 0 条、P4 3 条、P5 1 条。P5 在 11-15 10:00:03 发布的 Pin 上次仅作截止后提示，本次计入一次。

| 账号 | 区间新增 | Pin | 店铺 · Etsy 商品 | 实际发布时间 |
|---|---:|---|---|---|
| P1 `icyndizhang` | 3 | [801218590009836847](https://www.pinterest.com/pin/801218590009836847/) | StellaGoodsGifts · [4315989559](https://www.etsy.com/listing/4315989559/) | 11-15 10:05:02.650785 |
| P1 `icyndizhang` |  | [801218590009842930](https://www.pinterest.com/pin/801218590009842930/) | NiceCraftStudioHK · [1851761429](https://www.etsy.com/listing/1851761429/) | 11-15 21:00:03.296468 |
| P1 `icyndizhang` |  | [801218590009853028](https://www.pinterest.com/pin/801218590009853028/) | AmyHomeCrafts · [1851887061](https://www.etsy.com/listing/1851887061/) | 11-16 08:00:03.57698 |
| P2 `sailing_981` | 3 | [863494928599613806](https://www.pinterest.com/pin/863494928599613806/) | WoodHomeLiang · [4608807527](https://www.etsy.com/listing/4608807527/) | 11-15 10:10:02.907712 |
| P2 `sailing_981` |  | [863494928599619815](https://www.pinterest.com/pin/863494928599619815/) | MiawoodStudio · [1784400328](https://www.etsy.com/listing/1784400328/) | 11-15 21:05:06.430443 |
| P2 `sailing_981` |  | [863494928599628369](https://www.pinterest.com/pin/863494928599628369/) | LambertHouse · [4574351627](https://www.etsy.com/listing/4574351627/) | 11-16 08:05:02.086257 |
| P3 `mydecorshop` | 0 | — | — | — |
| P4 `cindyzhang62` | 3 | [675399275414921752](https://www.pinterest.com/pin/675399275414921752/) | ChicDecorHK · [1664536978](https://www.etsy.com/listing/1664536978/) | 11-15 10:15:03.739296 |
| P4 `cindyzhang62` |  | [675399275414928345](https://www.pinterest.com/pin/675399275414928345/) | PearlsTreasuresArt · [1836837324](https://www.etsy.com/listing/1836837324/) | 11-15 21:20:03.193984 |
| P4 `cindyzhang62` |  | [675399275414937264](https://www.pinterest.com/pin/675399275414937264/) | QuGifts · [4398996286](https://www.etsy.com/listing/4398996286/) | 11-16 08:20:03.612343 |
| P5 `ivy5205` | 1 | [713820609737975995](https://www.pinterest.com/pin/713820609737975995/) | NngGoods · [4582982364](https://www.etsy.com/listing/4582982364/) | 11-15 10:00:03.75578 |

**未发布、失败和待处理。** P3 的 Chtte [4616101190](https://www.etsy.com/listing/4616101190/) 仍为 `paused / uncertain`，历史错误 `pin_response_503`，无 Pin ID 或发布时间；队列 `35c31472-0b55-4f6d-bd70-eb336463ee80`，尝试 `c6bd08a5-afc4-495c-a309-8482d88efefb`。当前该路线的可用库存为 0；未确认这项历史异常以外的逐次未发布原因。四个 GitHub 发布 job 的实际日志无发布：[11-15 10:41](https://github.com/Sailin09/Store-Promotion/actions/runs/43668929845/job/132674413469)、[11-15 18:56](https://github.com/Sailin09/Store-Promotion/actions/runs/43706487476/job/132788585701)、[11-16 01:43](https://github.com/Sailin09/Store-Promotion/actions/runs/43742730985/job/132899233686)、[11-16 06:50](https://github.com/Sailin09/Store-Promotion/actions/runs/43771493547/job/132988173439)；首个只记录 `idle`，后三个记录 `outside_publish_window`。可见的 HTTP 200 / idle 未计为发布。

**补货入库。** 两个批次的 9 个不同 queue ID 均以数据库 `created_at` 落在区间内；当时和本次只读核验均为 `queue_status=ready`、`snapshot_matches=true`，来源与 Board ID 匹配。视觉时间来自各批的现场证据：详情卖家与店铺一致、在售选项或数量可选、Add to cart 可用，且实际查看了云端 CDP 主图截图。下表原图链接是该证据所指图片。

| 批次 | 店铺 · Etsy 商品 | 账号 | Board / ID | queue_id | 状态 / 快照 | 入库时间 | 视觉时间 · 主图所见 |
|---|---|---|---|---|---|---|---|
| A | Adamideal · [4362890083](https://www.etsy.com/listing/4362890083/handmade-mango-wood-pencil-holder-rustic) | P2 `sailing_981` | storage / `863494997243989843` | `7b20b513-c6f9-4af8-aa1a-207314c51dca` | ready / true | 11-15 13:18:25.285105 | 11-15 13:16:59.693 · [浅色竖纹与深色旋纹木笔筒](https://i.etsystatic.com/35172699/r/il/a5f97f/7166072084/il_794xN.7166072084_3fcq.jpg) |
| A | DanyHomeDesign · [4454760813](https://www.etsy.com/listing/4454760813/chenille-jacquard-curtain-vintage-floral) | P1 `icyndizhang` | CyndiZhangStudio / `801218658646993070` | `3de7d24e-61a1-4b93-8b0d-23ac761e0fab` | ready / true | 11-15 13:18:26.695125 | 11-15 13:15:20.598 · [深色帘上的浅花叶](https://i.etsystatic.com/44677612/r/il/53fe06/7778896714/il_794xN.7778896714_rz55.jpg) |
| A | NngGoods · [4582967541](https://www.etsy.com/listing/4582967541/natural-gemstone-drawer-pull-brass) | P5 `ivy5205` | Furniture / `713820678377803412` | `e11b1462-4fba-4edd-808c-37eab5211781` | ready / true | 11-15 13:18:27.955361 | 11-15 13:15:30.033 · [多色圆柱石质旋钮](https://i.etsystatic.com/57194200/r/il/84b8b7/8877259961/il_794xN.8877259961_lnft.jpg) |
| A | QuGifts · [4353448834](https://www.etsy.com/listing/4353448834/handwoven-shell-trim-storage-basket-boho) | P4 `cindyzhang62` | Decor / `675399344056772225` | `cce7be1b-20bc-46fc-911b-bc8dd392d3d3` | ready / true | 11-15 13:18:29.08436 | 11-15 13:16:05.890 · [白贝壳饰边编织篮](https://i.etsystatic.com/38006525/r/il/e51a9a/7115438144/il_794xN.7115438144_a2h6.jpg) |
| A | StellaGoodsGifts · [4316031169](https://www.etsy.com/listing/4316031169/floral-jacquard-pillow-cover-french) | P1 `icyndizhang` | CyndiZhangStudio / `801218658646993070` | `469f23b0-5f19-4aa0-8a5e-73d9f213cdb7` | ready / true | 11-15 13:18:29.75098 | 11-15 13:15:32.259 · [绿色野花方形抱枕套](https://i.etsystatic.com/54217402/r/il/40fbc4/8445154723/il_794xN.8445154723_srn5.jpg) |
| A | WoodHomeLiang · [1770022046](https://www.etsy.com/listing/1770022046/handcrafted-walnut-wood-hangers-with) | P2 `sailing_981` | storage / `863494997243989843` | `0e47d24a-b6ce-405c-8bc4-294cd51341ba` | ready / true | 11-15 13:18:30.270892 | 11-15 13:15:14.939 · [金色挂钩的弧形深木衣架](https://i.etsystatic.com/38928671/r/il/657f49/6272233091/il_794xN.6272233091_49z0.jpg) |
| B | MiawoodStudio · [1851918955](https://www.etsy.com/listing/1851918955/chic-bride-hanger-personalized-wooden) | P2 `sailing_981` | storage / `863494997243989843` | `58be59c5-5ab5-4a61-a6ec-75b4e431fe06` | ready / true | 11-16 01:20:23.754316 | 11-16 01:18:59.315 · [带横杆和金色挂钩的弧形木衣架](https://i.etsystatic.com/32100253/r/il/cf8853/6536335024/il_794xN.6536335024_lrwt.jpg) |
| B | NiceCraftStudioHK · [1439209860](https://www.etsy.com/listing/1439209860/floral-embroidered-lace-tablecloth) | P1 `icyndizhang` | CyndiZhangStudio / `801218658646993070` | `d2791cc0-9805-4d76-8522-0ad768d86215` | ready / true | 11-16 01:20:25.766643 | 11-16 01:19:03.362 · [扇贝边花卉蕾丝桌布](https://i.etsystatic.com/39068605/r/il/fa32ac/4824773654/il_794xN.4824773654_7d87.jpg) |
| B | PearlsTreasuresArt · [4397632029](https://www.etsy.com/listing/4397632029/natural-seashell-necklace-beach-holiday) | P4 `cindyzhang62` | Jewelry & Accessories / `675399344058025061` | `7f84485f-de19-49fc-b079-5181a7448ea6` | ready / true | 11-16 01:20:26.958452 | 11-16 01:18:56.433 · [手中三枚深绳贝壳吊坠](https://i.etsystatic.com/46725934/r/il/32bbef/7399169633/il_794xN.7399169633_ognm.jpg) |

| 批次与现场记录 | 首次执行 | 实际幂等重跑 | 入库后数据库核验 |
|---|---|---|---|
| A：[批次](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261115-051739.json) · [云端记录](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261115-051739.json) | [run 43680455282 / job 132709801279](https://github.com/Sailin09/Store-Promotion/actions/runs/43680455282/job/132709801279)：`inserted=6`，`failed=0` | 同 job 再执行，11-15 13:18:30.7688072：`no_new_verified_material, inserted=0` | [run 43680520259 / job 132709921109](https://github.com/Sailin09/Store-Promotion/actions/runs/43680520259/job/132709921109) |
| B：[批次](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261115-171936.json) · [云端记录](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261115-171936.json) | [run 43740472712 / job 132892412204](https://github.com/Sailin09/Store-Promotion/actions/runs/43740472712/job/132892412204)：`inserted=3`，`failed=0` | 同 job 再执行，11-16 01:20:27.3437851：`no_new_verified_material, inserted=0` | [run 43740559387 / job 132892562240](https://github.com/Sailin09/Store-Promotion/actions/runs/43740559387/job/132892562240) |

两批首次执行均无重复跳过或失败。前后只读核验的已知商品 ID 从 521 增至 530，新增 9 个与两批完全一致；未发现其它经证实的区间入库。**未入库候选：** [11-15 19:14](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261115-111520.json) 和 [11-16 07:15](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261115-231630.json) 两次检查发现同一组 13 个 HibiChStudio 新 ID，均不符合现有 `Wall & Door Organizers` 分类；同次可见的 Chtte 14 个、NinaJiaStudio 24 个和 ChicDecorHK 贝壳首饰 22 个均为已知 ID。其余未完成详情和主图核验的店面候选也未计入。

**当前库存（11-16 10:03:43.586 核验时点）。** 使用新 `replenishment_plan`，每条路线目标 3。32 条有效路线合计目标 96、可用 81、缺 15；24 条已达标。

| 未达标店铺 | 账号 | 可用 / 目标 | 缺口 |
|---|---|---:|---:|
| Chtte | P3 `mydecorshop` | 0 / 3 | 3 |
| HibiChStudio | P2 `sailing_981` | 0 / 3 | 3 |
| NinaJiaStudio | P5 `ivy5205` | 0 / 3 | 3 |
| ChicDecorHK | P4 `cindyzhang62` | 1 / 3 | 2 |
| AmyHomeCrafts | P1 `icyndizhang` | 2 / 3 | 1 |
| Chtte | P1 `icyndizhang` | 2 / 3 | 1 |
| LambertHouse | P2 `sailing_981` | 2 / 3 | 1 |
| QuGifts | P4 `cindyzhang62` | 2 / 3 | 1 |

| 已达标账号 | 店铺（各 3 / 3，缺口 0） |
|---|---|
| P1 `icyndizhang` | beou、ChicDecorHK、CustomCurtainsStudio、DanyHomeDesign、FrenchStyleDecor、GavinHome、HeyDream、KorusStore、MiraKiuStudio、NiceCraftStudioHK、Parkermo、ShirieHomeShow、SobiaStudio、StellaGoodsGifts、TunaMunStudio、WOGOL |
| P2 `sailing_981` | Adamideal、KoltCraftStudio、MiawoodStudio、WoodHomeLiang |
| P3 `mydecorshop` | CellaHo、LoomGoStudio |
| P4 `cindyzhang62` | PearlsTreasuresArt |
| P5 `ivy5205` | NngGoods |

**已修复与未解决。** [PR #8](https://github.com/Sailin09/Store-Promotion/pull/8) 的延迟晚间快照修复已合入，但本期[晚间报告 job](https://github.com/Sailin09/Store-Promotion/actions/runs/43752455376/job/132929340697)仍在北京时间 11-16 03:27:31 退出码 1；日志未给出根因，[留存产物](https://github.com/Sailin09/Store-Promotion/actions/runs/43752455376/artifacts/14176554246) 的内容未确认。之后[库存报告 job](https://github.com/Sailin09/Store-Promotion/actions/runs/43765835841/job/132970686505)更新了 Issue #2，晚间报告仍未确认恢复。首次缺口跟进仍为 [`completed`](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json)（10-23 已关闭额外跟进）；长期补货和现有发布调度保持原样。本次仅重跑只读核验。

**截止之后（不计入区间）。** 核验时，尚无可确认的截止后 Pin 或新增入库。11-16 10:00:00.087075 发出的调度请求 `1432` 尚无 HTTP 结果或业务结果，待后续核验。

**投递与归档。** 同一正文用于 [GitHub Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2) 的当日唯一日报评论和本云端任务聊天；[Markdown 归档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-16.md) · [JSON 证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-16.json)。设备通知送达未独立核验。