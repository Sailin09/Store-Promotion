# 执行日报 2026-11-22
<!-- store-promotion-daily:2026-11-22 -->

本区间真实新增 **9 个 Pin、7 条补货素材**。两批首次 inserted 分别 **5、2**，失败均 **0**，实际幂等重跑均 **inserted=0**；7 条新队列在新 Verify 中均为 **ready / snapshot_matches=true**。核验时有效库存 **74 条**，按每路线 target=3 计算缺口 **22 条**。P3 不确定发布和晚间云端报告失败仍未解决。

## 区间、时间与覆盖

- 北京时间 **2026-11-21 10:00（含）—2026-11-22 10:00（不含）**；UTC：2026-11-21T02:00:00Z—2026-11-22T02:00:00Z。承接上一次成功日报截止；读取 Issue #2 全部 **168 条评论**，未发现今日唯一标记。
- 本次通过 GitHub 连接器确认仓库访问，读取 main **5c0a403dbeb68a47adb716706a5270668e0059a7** 的证据目录、区间两批 batch、四份 cloud-run、首次跟进状态、云端运营文档、发布/补货/Verify 工作流及 SQL。按标题搜索找到[发布复核 Issue #3](https://github.com/Sailin09/Store-Promotion/issues/3)并读取正文及全部评论（0条）；其历史累计62条未用作每日基线。
- 本轮仅重跑最新只读 Verify：[run 44929348804 / 新 job 137061128893](https://github.com/Sailin09/Store-Promotion/actions/runs/44929348804/job/137061128893)。数据库时间 **2026-11-22 10:05:58.331483 北京时间**，距逻辑截止 **5分58.331秒**；实际证据核对时间 **10:07:21**，延迟 **7分21秒**。统计截止保持10:00，未随延迟移动。
- 按真实 published_at 和唯一 Pin ID 计数。daily_history 查询无 LIMIT，起点早于本区间，与逐账号 publication 记录交叉得到9条；本区间已发布商品均在上份已知ID中。7条补货按唯一 queue_id / created_at 计数，与两批实际入库日志一致；全部已审核 ready/scheduled 队列查询无 LIMIT，区间 created_at 记录恰为这7条。
- 运行列表读取100条，最早追溯至11月13日，覆盖本区间12个工作流运行；已读其实际业务job日志，包括最新Verify的新尝试。发布历史及已核实补货证据覆盖本区间。调度SQL只返回最近10条cron、20条HTTP，**逐次调度覆盖不完整**，不能证明区间所有调度请求均成功。
- 另有一条 **10:05 截止后发布**，下文单列，不计本区间9条。当前库存74是截止后数据库时点值，不是10:00库存或区间新增数。

## 逐账号发布与待处理

待处理列为核验时点值；ready/scheduled 不代表可立即发布。

| 账号 / handle | 区间真实新增Pin | 已审核ready/scheduled | paused/failed | draft |
|---|---:|---:|---:|---:|
| P1 / icyndizhang | 3 | 51 | 0 | 55 |
| P2 / sailing_981 | 3 | 12 | 0 | 26 |
| P3 / mydecorshop | 0 | 6 | 1 | 4 |
| P4 / cindyzhang62 | 2 | 2 | 0 | 0 |
| P5 / ivy5205 | 1 | 3 | 0 | 0 |

P3 的 **0** 由完整区间历史确认，区别于未确认。全部可核实新增如下，发布时间保留数据库原始UTC值：

| 账号 | 店铺 | Etsy商品 | Pin链接 | published_at（UTC） |
|---|---|---|---|---|
| P1 | GavinHome | [1589042222](https://www.etsy.com/listing/1589042222) | [801218590009939386](https://www.pinterest.com/pin/801218590009939386/) | 2026-11-21T02:05:03.210261+00:00 |
| P2 | Adamideal | [4486784943](https://www.etsy.com/listing/4486784943) | [863494928599709235](https://www.pinterest.com/pin/863494928599709235/) | 2026-11-21T02:10:02.483073+00:00 |
| P5 | NngGoods | [4537642423](https://www.etsy.com/listing/4537642423) | [713820609738079865](https://www.pinterest.com/pin/713820609738079865/) | 2026-11-21T02:40:02.763522+00:00 |
| P1 | HeyDream | [1803529307](https://www.etsy.com/listing/1803529307) | [801218590009945973](https://www.pinterest.com/pin/801218590009945973/) | 2026-11-21T13:00:04.308863+00:00 |
| P2 | WoodHomeLiang | [1753107678](https://www.etsy.com/listing/1753107678) | [863494928599714572](https://www.pinterest.com/pin/863494928599714572/) | 2026-11-21T13:05:02.528494+00:00 |
| P4 | PearlsTreasuresArt | [4338005523](https://www.etsy.com/listing/4338005523) | [675399275415021860](https://www.pinterest.com/pin/675399275415021860/) | 2026-11-21T13:50:03.480866+00:00 |
| P1 | KorusStore | [1254810571](https://www.etsy.com/listing/1254810571) | [801218590009954918](https://www.pinterest.com/pin/801218590009954918/) | 2026-11-22T00:00:05.492798+00:00 |
| P2 | KoltCraftStudio | [1741623086](https://www.etsy.com/listing/1741623086) | [863494928599722865](https://www.pinterest.com/pin/863494928599722865/) | 2026-11-22T00:05:02.083885+00:00 |
| P4 | QuGifts | [4318121435](https://www.etsy.com/listing/4318121435) | [675399275415030265](https://www.pinterest.com/pin/675399275415030265/) | 2026-11-22T00:50:02.310371+00:00 |

未发布、失败及原因：

- **P3 / Chtte**：[4616101190](https://www.etsy.com/listing/4616101190)，queue_id **35c31472-0b55-4f6d-bd70-eb336463ee80**，paused / uncertain，error=pin_response_503，Pin ID及发布历史为空。attempt_id **c6bd08a5-afc4-495c-a309-8482d88efefb**；结果仍不确定，不计新增，不自动重试。
- P3 的 CellaHo、LoomGoStudio 各3条 reserve_item 均 eligible_configuration=false。P3存在账号级未决尝试，会阻挡相关可发布配置；SQL是组合门槛，未独立排除其他原因。最近真实发布仍为 **2026-11-13T02:50:04.240759Z**。
- P1 的 Chtte 两条ready素材同样 eligible_configuration=false；保留店铺级未决尝试、跨账号间隔及防重复门槛。其他待发布素材仍受账号/店铺间隔、窗口、审核规则约束。
- 草稿：P1 55条、P2 26条均无图片；P3 4条中3条带图。草稿不计有效已审核库存或成功发布。
- 区间4个 Run Pinterest publisher job实际均 published=0：[02:17 job136695227601](https://github.com/Sailin09/Store-Promotion/actions/runs/44855069310/job/136695227601)为idle；[11:05 job136825951497](https://github.com/Sailin09/Store-Promotion/actions/runs/44897424217/job/136825951497)、[17:58 job136933349645](https://github.com/Sailin09/Store-Promotion/actions/runs/44932948273/job/136933349645)、[23:19 job137020184708](https://github.com/Sailin09/Store-Promotion/actions/runs/44961204651/job/137020184708)均 outside_publish_window。这些绿色工作流不计成功发布；上表9条取自真实数据库历史。

## 区间真实新增补货素材

7条 created_at 均在区间内，每条首次 inserted=1；以下状态由新Verify独立确认，source_matches 也全部为true。Board沿用已有核验映射。

| 序号 | shop / Etsy商品 | account / handle | Board名称 / ID | queue_id | queue_status / snapshot_matches |
|---|---|---|---|---|---|
| 1 | Adamideal · [4539284822](https://www.etsy.com/listing/4539284822/wooden-memory-card-organizer-box-sd-cf) | P2 / sailing_981 | storage / 863494997243989843 | 2d37023e-2bcc-4ae0-a89f-2459a3650806 | ready / true |
| 2 | FrenchStyleDecor · [4586862091](https://www.etsy.com/listing/4586862091/white-cotton-lace-apron-floral) | P1 / icyndizhang | CyndiZhangStudio / 801218658646993070 | ec8ea7ec-bdfb-491e-bc01-2d6637489614 | ready / true |
| 3 | GavinHome · [1310230212](https://www.etsy.com/listing/1310230212/white-embroidered-valance-curtains) | P1 / icyndizhang | CyndiZhangStudio / 801218658646993070 | f15fe9dc-9444-40c4-9ce5-c3d8081d4b9d | ready / true |
| 4 | LambertHouse · [4359115799](https://www.etsy.com/listing/4359115799/beech-black-metal-scarf-hanger-modern) | P2 / sailing_981 | storage / 863494997243989843 | 8c33c1cc-4211-4624-9114-b4ebdbd7f544 | ready / true |
| 5 | NngGoods · [4392493982](https://www.etsy.com/listing/4392493982/natural-crystal-cabinet-knob-gold-edge) | P5 / ivy5205 | Furniture / 713820678377803412 | ce87eacb-f72e-4d83-bb92-463cf523df81 | ready / true |
| 6 | HeyDream · [4453137591](https://www.etsy.com/listing/4453137591/tie-up-sheer-curtains-with-ruffle-rod) | P1 / icyndizhang | CyndiZhangStudio / 801218658646993070 | 0ba09d6f-3afe-4351-a19a-f8f5ac4730cc | ready / true |
| 7 | WoodHomeLiang · [4433496103](https://www.etsy.com/listing/4433496103/wide-shoulder-cedar-wood-hangersuit) | P2 / sailing_981 | storage / 863494997243989843 | d10ff739-d5c1-4dc6-b53d-ea7645c4620f | ready / true |

| 序号 | 实际入库 created_at（UTC） | 视觉核验 checked_at（UTC） | 原主图及具体证据 |
|---|---|---|---|
| 1 | 2026-11-21T05:23:27.672797+00:00 | 2026-11-21T05:21:29.745Z | [原图](https://i.etsystatic.com/35172699/r/il/559619/8362067394/il_794xN.8362067394_i4t2.jpg)：木质卡槽底座与透明层架陈列存储卡和USB设备；Style-1。 |
| 2 | 2026-11-21T05:23:29.450256+00:00 | 2026-11-21T05:21:29.745Z | [原图](https://i.etsystatic.com/33874695/r/il/f01b8e/8611047546/il_794xN.8611047546_dkmy.jpg)：白色长围裙，荷叶边肩带、花卉刺绣及镂空蕾丝下摆；quantity 1。 |
| 3 | 2026-11-21T05:23:30.116052+00:00 | 2026-11-21T05:21:29.745Z | [原图](https://i.etsystatic.com/36377996/r/il/35b367/6784201876/il_794xN.6784201876_mk0u.jpg)：白色刺绣布与尖拱形镂空蕾丝下缘；W59×L16 inches。 |
| 4 | 2026-11-21T05:23:30.804204+00:00 | 2026-11-21T05:21:29.745Z | [原图](https://i.etsystatic.com/46944744/r/il/2ec9a4/7194042171/il_794xN.7194042171_afbg.jpg)：六个带木条的黑色环形衣架，部分挂围巾；实际选2 PCS。 |
| 5 | 2026-11-21T05:23:32.261173+00:00 | 2026-11-21T05:21:29.745Z | [原图](https://i.etsystatic.com/57194200/r/il/5a2fba/8396650648/il_794xN.8396650648_bjy5.jpg)：白、绿、黑色粗晶质感旋钮，金属色包边与底座；实际选White / 1 pcs。 |
| 6 | 2026-11-21T17:18:37.523475+00:00 | 2026-11-21T17:17:22.431Z | [原图](https://i.etsystatic.com/35422134/r/il/dadbec/7820609908/il_794xN.7820609908_n4lo.jpg)：白色透光窗帘、荷叶边顶部与两条系带；W59×L47 inches / Rod pocket。 |
| 7 | 2026-11-21T17:18:43.315262+00:00 | 2026-11-21T17:17:22.577Z | [原图](https://i.etsystatic.com/38928671/r/il/8d855b/8411353749/il_794xN.8411353749_j5er.jpg)：四个宽肩木衣架、银色弯钩与裤杆；实际选2 PCS。 |

- **1—5 / 批次A**：从当时各登记店铺当前 storefront 发现，先排除前置新日志的572个已知ID，再进入真实详情核验卖家、可售选项及主Add to cart，并实际查看原主图CDP截图。来源分区、发现时间、全部选项及原始证据见[批次A](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261121-052129.json)和[运行审计A](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261121-052129.json)。
- **6—7 / 批次B**：分别从 HeyDream、WoodHomeLiang 当前 storefront 发现，排除577个已知ID，真实卖家及所选可售规格匹配，主Add to cart启用，实际查看两张原主图截图；见[批次B](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261121-171722.json)和[运行审计B](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261121-171722.json)。
- 本日报只读取上述当时的视觉证据，未重新审核商品、未刷新checked_at。原证据均visual_verified=true；图中陈列数量不等于购买数量，LambertHouse与WoodHomeLiang实际选项均为2 PCS。

| 批次 | 首次inserted | failed | 实际retry inserted | run / job |
|---|---:|---:|---:|---|
| A · batch-20261121-052129 | 5 | 0 | 0 | [44870606413 / 136744139249](https://github.com/Sailin09/Store-Promotion/actions/runs/44870606413/job/136744139249) |
| B · batch-20261121-171722 | 2 | 0 | 0 | [44929268521 / 136922197199](https://github.com/Sailin09/Store-Promotion/actions/runs/44929268521/job/136922197199) |

两份实际job日志均有逐条插入及随后真实幂等重跑inserted=0；7个queue_id互不重复。补货后独立Verify自动触发，本日报另做只读Verify重跑，未重跑补货。

未入库候选，均不计成功：

- HibiChStudio：**4420842205、4454344966、4559057618、4559038359、4559062406、4559684799、4420844641、4473116090、4473114318、4420839477、4517906376、4517885823、4454347860**，观察到其他收纳袋/箱/衣物罩，未建立 Wall & Door Organizers 分类匹配，未宣称详情或视觉通过。
- MiawoodStudio：[1669452239](https://www.etsy.com/listing/1669452239)，亚克力衣架，不符合 Wooden Hangers。
- QuGifts：**4399009375、4536203754、4536206015、4535556837**，门帘/隔断、餐具及包饰候选，未建立准确登记分类及完整详情/主图审核，未入库。
- Chtte当前14个ID、ChicDecorHK贝壳首饰22个、NinaJiaStudio24个、PearlsTreasuresArt31个唯一ID及QuGifts Wall Decor分区12个均已知。无新增筛查见[11时审计](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261121-111229.json)和[23时审计](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261121-231910.json)。无新增筛查不等于成功补货。

## 核验时点库存与缺口

数据库时点 **2026-11-22T02:05:58.331483Z**，32条有效店铺/账号路线，统一target=3。当前库存与区间新增7条分开统计；原SQL和云端Issue历史target=7未改，本日报用新usable重算。

| 店铺 | 账号 | usable | 缺口 |
|---|---|---:|---:|
| ChicDecorHK | P4 | 0 | 3 |
| Chtte | P3 | 0 | 3 |
| HibiChStudio | P2 | 0 | 3 |
| NinaJiaStudio | P5 | 0 | 3 |
| MiawoodStudio | P2 | 1 | 2 |
| PearlsTreasuresArt | P4 | 1 | 2 |
| QuGifts | P4 | 1 | 2 |
| Chtte | P1 | 2 | 1 |
| FrenchStyleDecor | P1 | 2 | 1 |
| KoltCraftStudio | P2 | 2 | 1 |
| KorusStore | P1 | 2 | 1 |
| Adamideal | P2 | 3 | 0 |
| AmyHomeCrafts | P1 | 3 | 0 |
| beou | P1 | 3 | 0 |
| CellaHo | P3 | 3 | 0 |
| ChicDecorHK | P1 | 3 | 0 |
| CustomCurtainsStudio | P1 | 3 | 0 |
| DanyHomeDesign | P1 | 3 | 0 |
| GavinHome | P1 | 3 | 0 |
| HeyDream | P1 | 3 | 0 |
| LambertHouse | P2 | 3 | 0 |
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
| **合计** | **32条路线** | **74** | **22** |

## 异常、修复与首次跟进

- P3 uncertain / pin_response_503、paused队列及发布配置未通过问题仍存在，未解决，未清空历史，未重试结果不确定的发布。
- [晚间 Cloud promotion operations run44945126755 / job136970738720](https://github.com/Sailin09/Store-Promotion/actions/runs/44945126755/job/136970738720) 在 **2026-11-21 20:14:09 UTC** 的 cloud-report.mjs 步骤输出 Cloud report failed、退出码1，REPORT_MODE=evening。根因未确认；日志中的弃用警告不能据此认定为根因。
- 随后[22时库存报告job137002363897](https://github.com/Sailin09/Store-Promotion/actions/runs/44955403561/job/137002363897)更新Issue #2，属于另一次库存执行，不能证明晚间报告问题已修复。其历史target=7缺口146不与本日报target=3缺口22混用。
- 区间补货失败0，未发现重复新增；没有可证实的新增代码修复。发布cron核验 active=true、*/5 * * * *；HTTP200 idle不计成功发布。逐次调度日志覆盖仍有限。
- first-deficit-followup.json 原状态 **completed**，历史首轮2条、实际重跑0条；本日报未改写或重复宣称首次完成。长期补货、既有发布/复核及修复安排保持原样。

## 截止后事件与投递

新日志检出 **P1 / FrenchStyleDecor** 于 **2026-11-22T02:05:02.494352Z（北京时间10:05:02）** 发布 [Pin 801218590009956000](https://www.pinterest.com/pin/801218590009956000/)，商品 [1271672587](https://www.etsy.com/listing/1271672587)。它在截止之后，**不计本区间9条**；当前库存74已反映该次消耗。没有检出截止后的新增已审核补货queue。

02:05:00.114511Z调度HTTP请求在核验日志中仍待完成；与上述Pin历史分别报告，不以请求未完成否认已持久化发布，也不推断该请求和Pin的归因关系。

本轮只执行只读核验与日报评论、文件及状态写入，未触发发布、补货、入队、修复或修改任何任务。完整正文保存至 [daily-report-2026-11-22.md](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-22.md)，配套证据为 [daily-report-2026-11-22.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-22.json)；Issue #2评论与本聊天使用同一正文。
