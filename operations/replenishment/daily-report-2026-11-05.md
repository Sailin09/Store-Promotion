# 执行日报 2026-11-05

<!-- store-promotion-daily:2026-11-05 -->

北京时间 **11月4日10:00（含）至11月5日10:00（不含）**，续接上次成功日报截止。区间实际发布 **13条**、真实补货入库 **13条**；核验时点可用 **83条**，按本任务每路线目标3条计算，缺口 **13条**。与上一日报核验时点对账：83 + 13 − 13 = 83。

本次于11月5日09:56开始读取证据，截止后重跑只读核验；数据库数据时点为 **10:00:26**，较逻辑截止晚26秒。[Verify 第3次执行日志](https://github.com/Sailin09/Store-Promotion/actions/runs/41876393366/job/126998716758)使用该运行原提交中的只读脚本，结果按真实发布时间分区间，未用累计62条作基线。截止后事件另列。

**逐账号实际发布**（下表时间均为北京时间）：P1 @icyndizhang 3条；P2 @sailing_981 3条；P3 @mydecorshop 2条；P4 @cindyzhang62 3条；P5 @ivy5205 2条。按唯一Pin去重，全部13条都有实际发布历史。

|账号|真实发布时间|店铺 / Etsy商品|实际Pin|
|---|---|---|---|
|P1|11-04 10:05:02|GavinHome [1707732808](https://www.etsy.com/listing/1707732808)|[801218590009647471](https://www.pinterest.com/pin/801218590009647471/)|
|P1|11-04 21:00:04|HeyDream [1809228191](https://www.etsy.com/listing/1809228191)|[801218590009653976](https://www.pinterest.com/pin/801218590009653976/)|
|P1|11-05 08:00:03|KorusStore [1341070659](https://www.etsy.com/listing/1341070659)|[801218590009662721](https://www.pinterest.com/pin/801218590009662721/)|
|P2|11-04 10:10:02|KoltCraftStudio [1841151987](https://www.etsy.com/listing/1841151987)|[863494928599440588](https://www.pinterest.com/pin/863494928599440588/)|
|P2|11-04 21:05:03|WoodHomeLiang [1839700218](https://www.etsy.com/listing/1839700218)|[863494928599446619](https://www.pinterest.com/pin/863494928599446619/)|
|P2|11-05 08:05:03|Adamideal [4525373104](https://www.etsy.com/listing/4525373104)|[863494928599455925](https://www.pinterest.com/pin/863494928599455925/)|
|P3|11-04 22:00:02|CellaHo [4477287827](https://www.etsy.com/listing/4477287827)|[499618152434324798](https://www.pinterest.com/pin/499618152434324798/)|
|P3|11-05 09:20:02|LoomGoStudio [4574329494](https://www.etsy.com/listing/4574329494)|[499618152434328640](https://www.pinterest.com/pin/499618152434328640/)|
|P4|11-04 10:15:02|PearlsTreasuresArt [4339515708](https://www.etsy.com/listing/4339515708)|[675399275414745637](https://www.pinterest.com/pin/675399275414745637/)|
|P4|11-04 21:20:02|QuGifts [4549007373](https://www.etsy.com/listing/4549007373)|[675399275414751788](https://www.pinterest.com/pin/675399275414751788/)|
|P4|11-05 08:10:03|ChicDecorHK [1735968559](https://www.etsy.com/listing/1735968559)|[675399275414760284](https://www.pinterest.com/pin/675399275414760284/)|
|P5|11-04 22:20:02|NinaJiaStudio [4477915577](https://www.etsy.com/listing/4477915577)|[713820609737792599](https://www.pinterest.com/pin/713820609737792599/)|
|P5|11-05 09:15:02|NngGoods [4537610223](https://www.etsy.com/listing/4537610223)|[713820609737801245](https://www.pinterest.com/pin/713820609737801245/)|

**区间真实补货素材**：以下13条经本次新数据库日志逐件读回，全部为 **queue_status=ready、snapshot_matches=true、source_matches=true**，尚未发布。入库时间按唯一queue的created_at计数；来源链接、原图和现场视觉核验时间沿用原始记录，未刷新为日报时间。

|店铺 / Etsy商品|account / handle|Board名称 / ID|queue_id|入库时间|现场视觉核验时间 / 原图|
|---|---|---|---|---|---|
|ChicDecorHK [1664510418](https://www.etsy.com/listing/1664510418/handcrafted-purple-seashell-pendant)|P4 cindyzhang62|未确认 / 675399344058025061|6bdaf0fc-20d8-4c3b-b02b-ff668ae999e1|11-04 13:16:39|11-04 13:15:55 [原图](https://i.etsystatic.com/32003756/r/il/f7f0b1/5762595466/il_794xN.5762595466_k3fx.jpg)|
|FrenchStyleDecor [4578917184](https://www.etsy.com/listing/4578917184/white-cotton-embroidered-lace-half-apron)|P1 icyndizhang|CyndiZhangStudio / 801218658646993070|a828ad09-16ed-4e3d-9e55-a83fa8a0c479|11-04 13:16:41|11-04 13:15:55 [原图](https://i.etsystatic.com/33874695/r/il/344275/8598363055/il_794xN.8598363055_lc1i.jpg)|
|GavinHome [1589042222](https://www.etsy.com/listing/1589042222/white-embroidered-sheer-curtain-romantic)|P1 icyndizhang|CyndiZhangStudio / 801218658646993070|33ccfc35-80a8-47f0-8d18-8cdd6b21a444|11-04 13:16:41|11-04 13:15:55 [原图](https://i.etsystatic.com/36377996/r/il/916c9c/5517607349/il_794xN.5517607349_ecky.jpg)|
|KoltCraftStudio [1753487209](https://www.etsy.com/listing/1753487209/wide-shoulder-wooden-hangers-closet)|P2 sailing_981|storage / 863494997243989843|4227e52e-ae27-408e-9c74-0dcb67bb6028|11-04 13:16:44|11-04 13:15:55 [原图](https://i.etsystatic.com/43671795/r/il/6313f8/6135134089/il_794xN.6135134089_q8us.jpg)|
|LoomGoStudio [4574768175](https://www.etsy.com/listing/4574768175/30-momme-mulberry-silk-blend-jacquard)|P3 mydecorshop|Home Decor / 499618221101238533|39c88c47-da6c-456b-8e06-d7af2c521ecb|11-04 13:16:51|11-04 13:15:55 [原图](https://i.etsystatic.com/58959935/r/il/3ab83c/8835403719/il_794xN.8835403719_lsjq.jpg)|
|MiawoodStudio [1877312583](https://www.etsy.com/listing/1877312583/camphor-wood-wide-shoulder-hanger-suit)|P2 sailing_981|storage / 863494997243989843|bcd99e27-9738-47f3-acc3-50413481ceca|11-04 13:16:53|11-04 13:15:55 [原图](https://i.etsystatic.com/32100253/r/il/0c5c98/6660107252/il_794xN.6660107252_3ck4.jpg)|
|NngGoods [4571799194](https://www.etsy.com/listing/4571799194/natural-turquoise-cabinet-knob-brass)|P5 ivy5205|Furniture / 713820678377803412|9826cd4a-1760-45af-9c29-22b0742eddf8|11-04 13:16:55|11-04 13:15:55 [原图](https://i.etsystatic.com/57194200/r/il/91c271/8497579998/il_794xN.8497579998_8m01.jpg)|
|PearlsTreasuresArt [4320749748](https://www.etsy.com/listing/4320749748/white-seashell-stud-earrings-sterling)|P4 cindyzhang62|未确认 / 675399344058025061|c41cf929-3dde-4b2f-bacb-f7470b0c6a01|11-04 13:16:57|11-04 13:15:55 [原图](https://i.etsystatic.com/46725934/r/il/b6da6b/6941357650/il_794xN.6941357650_dlzq.jpg)|
|CellaHo [1853801813](https://www.etsy.com/listing/1853801813/floral-embroidered-cotton-linen-fabric)|P3 mydecorshop|Home Decor / 499618221101238533|25563a99-9861-41aa-97cd-2f50efc7e639|11-05 01:18:38|11-05 01:17:50 [原图](https://i.etsystatic.com/39663062/r/il/2d013f/6592783261/il_794xN.6592783261_mudz.jpg)|
|HeyDream [1803529307](https://www.etsy.com/listing/1803529307/white-lace-sheer-curtain-farmhouse)|P1 icyndizhang|CyndiZhangStudio / 801218658646993070|90c9e996-b88b-401a-b504-86221e06628f|11-05 01:18:41|11-05 01:17:50 [原图](https://i.etsystatic.com/35422134/r/il/f81276/6365146367/il_794xN.6365146367_5r8k.jpg)|
|NinaJiaStudio [4415243185](https://www.etsy.com/listing/4415243185/travel-makeup-bag-double-layer-cosmetic)|P5 ivy5205|未确认 / 713820678377803445|bf4fc897-16b9-49ea-98d5-97a668f77df0|11-05 01:18:43|11-05 01:17:50 [原图](https://i.etsystatic.com/61131894/r/il/5e0481/7506779939/il_794xN.7506779939_5aka.jpg)|
|QuGifts [4549019262](https://www.etsy.com/listing/4549019262/capiz-shell-wind-chime-dreamcatcher-wall)|P4 cindyzhang62|未确认 / 675399344056772225|c4eec0fc-9e9f-44f5-b782-142b1bc3986d|11-05 01:18:44|11-05 01:17:50 [原图](https://i.etsystatic.com/38006525/r/il/0413c7/8380900517/il_794xN.8380900517_iz2x.jpg)|
|WoodHomeLiang [1702135608](https://www.etsy.com/listing/1702135608/camphor-wood-hangers-for-sweater-jacket)|P2 sailing_981|storage / 863494997243989843|032d6b19-b680-400d-b253-e8a0c2057ec7|11-05 01:18:48|11-05 01:17:50 [原图](https://i.etsystatic.com/38928671/r/il/73f4f4/5973036273/il_794xN.5973036273_89v6.jpg)|

- [早轮现场证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261104-051555.json)及[原始批次](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261104-051555.json)：[首次入库及实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/41778191651/job/126403473877)逐件各新增1，合计 **inserted=8、failed=0**；同一job随后实际再执行入库，返回 **inserted=0**。
- [晚轮现场证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261104-171750.json)及[原始批次](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261104-171750.json)：[首次入库及实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/41876220134/job/126736453664)逐件各新增1，合计 **inserted=5、failed=0**；随后实际再执行返回 **inserted=0**。两轮共13个唯一queue，无重复插入。
- 两轮原始证据逐件记录真实卖家、已选在售规格、可用Add to cart及远程CDP实际主图观察。P4两类Board、P5化妆包Board的名称仍未确认，仅报告已核验ID，不猜名称。

**未入库候选**：[11月4日19:19检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261104-111908.json)与[11月5日07:16—07:17检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261104-231444.json)无符合现有路线的未入库新品，均未建批次、未执行入库或幂等重跑。Chtte店面7款均已知，HibiChStudio符合Wall & Door Organizers路线的8款也已知；其余13款衣柜、箱篮、衣物及床品收纳候选不计成功：
[4559057618](https://www.etsy.com/listing/4559057618)、[4559038359](https://www.etsy.com/listing/4559038359)、[4559062406](https://www.etsy.com/listing/4559062406)、[4559684799](https://www.etsy.com/listing/4559684799)、[4420844641](https://www.etsy.com/listing/4420844641)、[4473116090](https://www.etsy.com/listing/4473116090)、[4473114318](https://www.etsy.com/listing/4473114318)、[4420839477](https://www.etsy.com/listing/4420839477)、[4420842205](https://www.etsy.com/listing/4420842205)、[4517906376](https://www.etsy.com/listing/4517906376)、[4517885823](https://www.etsy.com/listing/4517885823)、[4454347860](https://www.etsy.com/listing/4454347860)、[4454344966](https://www.etsy.com/listing/4454344966)。这些排除项未完成新详情与主图审核，不能称视觉核验通过；旧布料4325858718未复用。

**核验时点库存**（32条有效路线，每路线目标3；与区间新增分开统计）：

|账号|可用 / 缺口|缺口路线（可用/缺口）|已达标路线（各3/0）|
|---|---|---|---|
|P1|50 / 4|Chtte 0/3、KorusStore 2/1|AmyHomeCrafts、beou、ChicDecorHK、CustomCurtainsStudio、DanyHomeDesign、FrenchStyleDecor、GavinHome、HeyDream、MiraKiuStudio、NiceCraftStudioHK、Parkermo、ShirieHomeShow、SobiaStudio、StellaGoodsGifts、TunaMunStudio、WOGOL|
|P2|15 / 3|HibiChStudio 1/2、Adamideal 2/1|KoltCraftStudio、LambertHouse、MiawoodStudio、WoodHomeLiang|
|P3|5 / 4|Chtte 0/3、LoomGoStudio 2/1|CellaHo|
|P4|8 / 1|ChicDecorHK 2/1|PearlsTreasuresArt、QuGifts|
|P5|5 / 1|NngGoods 2/1|NinaJiaStudio|

**口径差异需留意**：最新main的replenishment-plan.sql、cloud-operations.md及Issue #2现有库存报告已采用目标7，后者显示缺口141。它与本日报要求的目标3不一致；本日报保持目标3，依据同一批真实usable计算缺口13。最新核验重跑沿用原提交的目标3脚本。此处仅报告差异，未改脚本、映射或任务。

**未发布、失败与待处理**：五账号均active且OAuth已连接，发布设置和数据库五分钟调度启用。可用素材83条；另有draft：P1 55条（有图0）、P2 26条（有图0）、P3 4条（有图3）、P4/P5各0，这85条草稿不计可用库存，不能当成已审核待发成功。新日志未见未完成发布尝试，区间13条历史均为published。[最新发布job](https://github.com/Sailin09/Store-Promotion/actions/runs/41935714153/job/126943524648)于11月5日07:41返回 idle / outside_publish_window、published=0，不计发布；随后数据库自动调度的实际Pin已计入上表。调度日志只覆盖最近20条HTTP与10条cron，全区间瞬时错误覆盖不完整，不能据此宣称全天零错误。

**截止后**：10:00:00发起的调度请求在10:00:26核验时仍待完成；未见截止后新增Pin，未计入区间。

区间补货日志未见失败，未发生本日报执行的业务修复。尚未解决：上述13条缺口、无合格未入库新品的Chtte/Hibi路线，以及目标3/7口径差异。首次缺口跟进保持 **completed**；长期补货继续。本日报未触发发布、补货、入队、修复或更改任何相关任务，也未触碰历史发布复核及本地任务。

**证据与投递**：本次通过GitHub连接器确认访问，读取最新main区间batch、cloud-run、既有verification、首次跟进状态及云端说明，核对Issue #2全部70条既有评论（无当日标记），并按标题找到[历史发布复核Issue](https://github.com/Sailin09/Store-Promotion/issues/3)。新日志daily_history查询无条数上限，覆盖完整统计区间；逐账号publication用于核对商品ID，Issue店铺明细作交叉核对。[完整日报存档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-05.md) · [配套证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-05.json)。同文已保存并投递Issue #2；聊天独立读回及设备通知送达未确认。
