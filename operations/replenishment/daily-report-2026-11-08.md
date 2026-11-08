# 执行日报 2026-11-08

<!-- store-promotion-daily:2026-11-08 -->

北京时间 **11月7日10:00（含）至11月8日10:00（不含）**：实际新增 **14条 Pin**，实际补货入库 **12条**。核验时点可用 **85条**；32条有效店铺/账号路线按目标 **3条**计算，合计缺 **11条**。与上次日报库存对账：**87 + 12 − 14 = 85**。

逻辑截止为 **2026-11-08 10:00 Asia/Shanghai（02:00 UTC）**，起点续接已成功日报截止。实际 GitHub 核查于 **10:03:43** 开始；[只读 Verify job](https://github.com/Sailin09/Store-Promotion/actions/runs/42395995571/job/128597663504)于 **10:04:20** 启动，数据库审计时间 **10:04:29.051611**，分别较截止晚3分43秒、4分20秒及4分29秒。下列时间均为北京时间；毫秒以下精度及原始 UTC 时间保存在配套 JSON。当前库存是核验时点值，区间事件按真实时间过滤。

**逐账号实际发布**

|账号 / handle|区间唯一 Pin 数|核验时可用待发布|草稿（其中有图）|
|---|---:|---:|---:|
|P1 @icyndizhang|3|52|55（0）|
|P2 @sailing_981|3|14|26（0）|
|P3 @mydecorshop|3|6|4（3）|
|P4 @cindyzhang62|3|8|0（0）|
|P5 @ivy5205|2|5|0（0）|
|合计|14|85|85（3）|

|账号|真实发布时间|店铺 / Etsy 商品|实际 Pin|
|---|---|---|---|
|P1|11-07 10:05:02|ShirieHomeShow [1838608268](https://www.etsy.com/listing/1838608268)|[801218590009697899](https://www.pinterest.com/pin/801218590009697899/)|
|P1|11-07 21:00:04|SobiaStudio [4301845181](https://www.etsy.com/listing/4301845181)|[801218590009704650](https://www.pinterest.com/pin/801218590009704650/)|
|P1|11-08 08:00:03|MiraKiuStudio [4464842770](https://www.etsy.com/listing/4464842770)|[801218590009712823](https://www.pinterest.com/pin/801218590009712823/)|
|P2|11-07 10:10:03|LambertHouse [1814340841](https://www.etsy.com/listing/1814340841)|[863494928599488156](https://www.pinterest.com/pin/863494928599488156/)|
|P2|11-07 21:05:02|MiawoodStudio [1863083260](https://www.etsy.com/listing/1863083260)|[863494928599493216](https://www.pinterest.com/pin/863494928599493216/)|
|P2|11-08 08:05:02|Adamideal [4547220174](https://www.etsy.com/listing/4547220174)|[863494928599500915](https://www.pinterest.com/pin/863494928599500915/)|
|P3|11-07 10:20:03|LoomGoStudio [4574768175](https://www.etsy.com/listing/4574768175)|[499618152434342109](https://www.pinterest.com/pin/499618152434342109/)|
|P3|11-07 21:20:02|Chtte [4577582372](https://www.etsy.com/listing/4577582372)|[499618152434344016](https://www.pinterest.com/pin/499618152434344016/)|
|P3|11-08 08:20:02|CellaHo [1853801813](https://www.etsy.com/listing/1853801813)|[499618152434347254](https://www.pinterest.com/pin/499618152434347254/)|
|P4|11-07 10:30:02|PearlsTreasuresArt [4320749748](https://www.etsy.com/listing/4320749748)|[675399275414794427](https://www.pinterest.com/pin/675399275414794427/)|
|P4|11-07 21:35:02|QuGifts [4549019262](https://www.etsy.com/listing/4549019262)|[675399275414800888](https://www.pinterest.com/pin/675399275414800888/)|
|P4|11-08 08:25:02|ChicDecorHK [4358550068](https://www.etsy.com/listing/4358550068)|[675399275414809070](https://www.pinterest.com/pin/675399275414809070/)|
|P5|11-07 22:30:03|NinaJiaStudio [4415243185](https://www.etsy.com/listing/4415243185)|[713820609737844463](https://www.pinterest.com/pin/713820609737844463/)|
|P5|11-08 09:30:02|NngGoods [4571807242](https://www.etsy.com/listing/4571807242)|[713820609737853744](https://www.pinterest.com/pin/713820609737853744/)|

以上14条均有 `publish_history.publish_status=published`，关联队列及发布尝试为 `published`，快照匹配。按唯一 Pin ID 去重，无重复计数。此次发布历史查询无条数上限，从11月7日00:00覆盖至本次核验，足以覆盖日报区间；未使用历史累计62条作为每日基线。Pin链接来自数据库真实发布记录，本日报未另行打开 Pinterest 页面核查公开展示状态。

**区间实际补货：12条**

下表12条均按真实 `created_at`落入区间，入库后独立数据库核验及本次核验均为 `queue_status=ready`、`snapshot_matches=true`，来源匹配。未将候选、workflow success或空闲响应计作入库。

|店铺 / Etsy 商品来源|账号 / handle|Board名称 / ID|queue_id|queue_status / snapshot_matches|真实入库时间|
|---|---|---|---|---|---|
|CellaHo [4432276600](https://www.etsy.com/listing/4432276600/beige-embroidered-lace-tulle-fabric)|P3 @mydecorshop|Home Decor / 499618221101238533|f577416a-1278-4a41-81db-923e0c0e1605|ready / true|11-07 13:20:34|
|ChicDecorHK [1736022367](https://www.etsy.com/listing/1736022367/handmade-gold-plated-shell-earrings)|P4 @cindyzhang62|Jewelry & Accessories / 675399344058025061|36d9237e-e968-4f96-8ed3-fe8aa21fe511|ready / true|11-07 13:20:35|
|LambertHouse [4574288059](https://www.etsy.com/listing/4574288059/non-slip-clothes-hanger-no-bump-design)|P2 @sailing_981|storage / 863494997243989843|32796988-69f3-48bf-ae63-8f957a0ec092|ready / true|11-07 13:20:38|
|LoomGoStudio [4573015594](https://www.etsy.com/listing/4573015594/teal-gold-jacquard-fabric-metallic)|P3 @mydecorshop|Home Decor / 499618221101238533|a7de81ce-819c-492a-b2d8-fb61ac376a83|ready / true|11-07 13:20:39|
|NngGoods [4538050408](https://www.etsy.com/listing/4538050408/natural-veined-limestone-cabinet-knob)|P5 @ivy5205|Furniture / 713820678377803412|6dc8db77-00e7-4aee-838d-24702aea5b0c|ready / true|11-07 13:20:40|
|Parkermo [4548333454](https://www.etsy.com/listing/4548333454/dark-green-gingham-cafe-curtain-vintage)|P1 @icyndizhang|CyndiZhangStudio / 801218658646993070|38044c68-1c75-4e1c-9ace-9ef730efb2ef|ready / true|11-07 13:20:42|
|PearlsTreasuresArt [4397640177](https://www.etsy.com/listing/4397640177/natural-shell-earrings-maillard-retro)|P4 @cindyzhang62|Jewelry & Accessories / 675399344058025061|ae1c681b-3a7e-4d98-a3df-632b4a2ecebb|ready / true|11-07 13:20:42|
|ShirieHomeShow [4334557253](https://www.etsy.com/listing/4334557253/embroidered-clover-sheer-curtain)|P1 @icyndizhang|CyndiZhangStudio / 801218658646993070|4ee80676-4fda-4425-85eb-a388a7471aad|ready / true|11-07 13:20:43|
|MiawoodStudio [1433295652](https://www.etsy.com/listing/1433295652/personalized-bride-and-groom-hanger)|P2 @sailing_981|storage / 863494997243989843|ecfea76d-3c1c-42fa-a0b6-84ae2e498748|ready / true|11-08 01:22:20|
|NinaJiaStudio [4415229681](https://www.etsy.com/listing/4415229681/double-layer-makeup-bag-large-small)|P5 @ivy5205|Fashion / 713820678377803445|538c0710-f38f-4c9a-899e-ab72d7ec1812|ready / true|11-08 01:22:21|
|QuGifts [4338882015](https://www.etsy.com/listing/4338882015/handmade-shell-sculpture-coastal-boho)|P4 @cindyzhang62|Decor / 675399344056772225|9fb744d8-e655-40cf-a859-bcffb3e22fe4|ready / true|11-08 01:22:22|
|SobiaStudio [4335736083](https://www.etsy.com/listing/4335736083/red-floral-ruffled-curtain-farmhouse)|P1 @icyndizhang|CyndiZhangStudio / 801218658646993070|13d551a5-65d2-4545-a570-9da5b46e1f09|ready / true|11-08 01:22:23|

以下为**原补货运行记录的实际详情及主图核验**，本日报读取原证据，未重做商品核验、未刷新原时间。12条均记录卖家店铺链接匹配、选择下列在售选项后 Add to cart 可用，以及实际主图截图观察；`visual_verified=true`。完整分类、文案、来源、原图URL及观察说明见原批次和本日报 JSON。

|商品ID|原现场核验时间|选项与实际主图观察|
|---|---|---|
|4432276600|11-07 13:16:22.417|0.5 Yards；米白网纱上的花卉卷草刺绣；[原图](https://i.etsystatic.com/39663062/r/il/1c9067/7596278007/il_794xN.7596278007_j9qo.jpg)|
|1736022367|11-07 13:16:51.107|无需选项；模特耳上的金色耳钩与细长螺旋贝壳；[原图](https://i.etsystatic.com/32003756/r/il/cd47f7/6058257285/il_794xN.6058257285_3rtm.jpg)|
|4574288059|11-07 13:17:13.977|5 PCS、Gold Hook - Brown；棕色及奶油色宽肩衣架；[原图](https://i.etsystatic.com/46944744/r/il/6188ce/8807222218/il_794xN.8807222218_g730.jpg)|
|4573015594|11-07 13:17:38.561|1 Yard、A；青蓝粉色提花、浅色方格及金色纹样；[原图](https://i.etsystatic.com/58959935/r/il/ca4e93/8815265819/il_794xN.8815265819_m8at.jpg)|
|4538050408|11-07 13:18:03.207|Small、1 PCS；深浅纹理的不规则石材旋钮与金色底座；[原图](https://i.etsystatic.com/57194200/r/il/ca0479/8531597331/il_794xN.8531597331_obro.jpg)|
|4548333454|11-07 13:18:25.251|Rod Pocket、W26xL12 inches；绿白格咖啡帘及波浪蕾丝边；[原图](https://i.etsystatic.com/41687571/r/il/5a6277/8525794064/il_794xN.8525794064_mdyc.jpg)|
|4397640177|11-07 13:18:49.879|Stud 1 Pair；金色耳钉、珠状饰件及条纹螺旋贝壳；[原图](https://i.etsystatic.com/46725934/r/il/2cd83b/7399826427/il_794xN.7399826427_k8rm.jpg)|
|4334557253|11-07 13:19:12.280|1 PCS W39xL47 inches、C01；白色纱帘上的绿色三叶草刺绣；[原图](https://i.etsystatic.com/46873252/r/il/a84385/7072518581/il_794xN.7072518581_kmlm.jpg)|
|1433295652|11-08 01:19:47.724|1 pc；木杆上的三只棕色宽肩木衣架；[原图](https://i.etsystatic.com/32100253/r/il/9fc856/6210335080/il_794xN.6210335080_50dy.jpg)|
|4415229681|11-08 01:20:15.079|L-10.2 X7X2 inch；紫花绿叶双层拉链包及放入瓶子的手；[原图](https://i.etsystatic.com/61131894/r/il/91d46e/7518515639/il_794xN.7518515639_1g9f.jpg)|
|4338882015|11-08 01:20:41.304|A；木桌黑色支架上的白色贝壳圈、棕色螺旋贝壳圈和深色长饰件；[原图](https://i.etsystatic.com/38006525/r/il/5369de/7086268689/il_794xN.7086268689_b1ij.jpg)|
|4335736083|11-08 01:21:06.324|1 PCS W39xL59 inch、Rod Pocket；奶油色小粉玫瑰窗帘、荷叶边与绑带；[原图](https://i.etsystatic.com/42208273/r/il/aa0964/7124847120/il_794xN.7124847120_2xjs.jpg)|

|批次 / 现场证据|首次实际入库及幂等重跑|独立入库后数据库证据|
|---|---|---|
|[batch-20261107-051912](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261107-051912.json) · [cloud-run](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261107-051912.json)|[run 42342266168 / job 128312416677](https://github.com/Sailin09/Store-Promotion/actions/runs/42342266168/job/128312416677)：首次 inserted=8、failed=0；实际第二次命令 inserted=0（11-07 13:20:43.550）|[run 42342338987 / job 128312548228](https://github.com/Sailin09/Store-Promotion/actions/runs/42342338987/job/128312548228)：11-07 13:20:59.690509，8条均ready且快照匹配；库存83→91，缺口13→5|
|[batch-20261107-172106](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261107-172106.json) · [cloud-run](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261107-172106.json)|[run 42395922298 / job 128473239726](https://github.com/Sailin09/Store-Promotion/actions/runs/42395922298/job/128473239726)：首次 inserted=4、failed=0；实际第二次命令 inserted=0（11-08 01:22:24.083）|[run 42395995571 / job 128473357950](https://github.com/Sailin09/Store-Promotion/actions/runs/42395995571/job/128473357950)：11-08 01:22:45.405125，4条均ready且快照匹配；库存86→90，缺口10→6|

两个实际重跑合计新增0；12个queue_id及商品ID均唯一。本次日报只读取上述历史入库和重跑证据，没有重新执行补货。

**未入库候选与未补足路线**

[11-07 19:15现场记录](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261107-111550.json)与[11-08 07:11现场记录](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261107-231115.json)均记载：Chtte当前13款全部为已知ID；HibiChStudio当前21款中，符合原 Wall & Door Organizers 路线的8款全部已知，其余13款收纳箱/袋不符合原分类。该两轮没有合格新品，未进入新品详情和主图核验、未建批次、未执行入库或幂等重跑，不计成功补货。完整排除ID保存在原cloud-run与配套JSON。

HibiChStudio被排除的13个非原分类候选：4454344966、4559057618、4559038359、4559062406、4559684799、4420844641、4473116090、4473114318、4420839477、4420842205、4517906376、4517885823、4454347860。

**核验时点全部路线库存**

目标仍为每路线3条；“可用/缺口”按此计算。达标栏每个店铺均为3/0，包含全部32条路线。

|账号 / handle|可用 / 缺口合计|未达标路线（可用/缺口）|达标路线（各3/0）|
|---|---|---|---|
|P1 @icyndizhang|52 / 2|Chtte 2/1、MiraKiuStudio 2/1|AmyHomeCrafts、beou、ChicDecorHK、CustomCurtainsStudio、DanyHomeDesign、FrenchStyleDecor、GavinHome、HeyDream、KorusStore、NiceCraftStudioHK、Parkermo、ShirieHomeShow、SobiaStudio、StellaGoodsGifts、TunaMunStudio、WOGOL|
|P2 @sailing_981|14 / 4|HibiChStudio 0/3、Adamideal 2/1|KoltCraftStudio、LambertHouse、MiawoodStudio、WoodHomeLiang|
|P3 @mydecorshop|6 / 3|Chtte 1/2、CellaHo 2/1|LoomGoStudio|
|P4 @cindyzhang62|8 / 1|ChicDecorHK 2/1|PearlsTreasuresArt、QuGifts|
|P5 @ivy5205|5 / 1|NngGoods 2/1|NinaJiaStudio|
|合计|85 / 11|8条路线未达标，其中1条为零库存|24条路线达标|

可用计数要求队列ready/scheduled、商品active、文案ready、审核快照匹配，且商品核验与审核时间均在29天内；85条当前储备还均通过配置资格检查。85条草稿不计可用。当前 SQL 和既有GitHub库存报告采用目标7（此次SQL缺口139）；本日报按用户指定目标3报告11条缺口，未修改映射、门槛或库存目标配置。Chtte P3仍对应 Kitchen & Dining / 499618221101215211，分类 Chair Cushions & Seat Pads；历史不可用商品4325858718未作为新增补货。

**未发布、失败、已解决与待处理**

- 五账号均active、OAuth已连接，账号状态为authorized_trial；发布设置enabled、access_tier=standard，Supabase五分钟调度 `*/5 * * * *`启用。85条可用素材待既有调度处理；窗口为08:00–11:00、21:00–23:00，账号最小间隔2小时，另保留店铺限频。尚未发布本身不等同失败，逐条未来发布时间未确认。
- 本次数据库未见未完成/不确定发布尝试；五账号审核队列未见failed/paused，店铺覆盖查询的paused_or_failed均为0。区间14条发布均成功。调度查询仅返回最近10条cron与20条HTTP记录，**全区间瞬时错误覆盖不完整**，不能据此断言全天零错误。
- [区间最新GitHub发布job](https://github.com/Sailin09/Store-Promotion/actions/runs/42430683894/job/128578676719)返回 `idle`、published=0；区间另4个发布job也为空闲，其中3个明确outside_publish_window。这些结果均未计作发布成功，14条数量以数据库历史为准。
- [晚间报告run 42400239930 / job 128486323384](https://github.com/Sailin09/Store-Promotion/actions/runs/42400239930/job/128486323384)于11-08 02:14:37在报告步骤退出码1失败，仅提示“Cloud report failed; inspect workflow steps.”，日志未说明根因，artifact列表为空。[后续库存报告job](https://github.com/Sailin09/Store-Promotion/actions/runs/42413148374/job/128525473145)于11-08 04:53更新Issue #2，但这不能证明晚间报告已修复；**晚间报告恢复未确认**。
- 区间补货入库失败0；当前缺口11条仍未解决，其中HibiChStudio P2可用0、缺3。两次店面检查未发现符合原路线的新ID；其余缺口按上述库存表保留。本次没有执行修复；区间main提交仅含日报、批次及运行证据，未发现新增脚本/工作流修复提交。
- [首次缺口跟进状态](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json)仍为 `completed`（2026-10-23原闭环：首次inserted=2、实际retry=0、剩余缺口0）。这是历史已完成状态，长期补货继续；本次未重开或更改跟进状态。
- 本次仅重跑只读Verify并写日报证据、评论及日报续接状态；没有触发发布、补货、入队、修复或重置历史，没有更改现有发布、每6小时补货、跟进或其他任务，也没有创建本地任务。

**截止后事件（不计入区间）**

11-08 10:00:00.140944发起的调度请求952，在10:04:29核验时尚无完成时间、HTTP状态或业务结果，标为待完成，未计作成功或失败。此次查询未见截止后新增Pin或入库；本次Verify重跑及日报投递发生在截止后，仅作核验/投递证据。后续新事件留待下份日报。

**覆盖与投递证据**

本次通过GitHub连接器确认仓库访问，读取main `1d93aae10e65c3a2c94020b52629622c4bb4a73b`、完整证据目录、区间2个batch与4个cloud-run、历史verification、首次跟进状态、cloud-operations文档、工作流及实际job日志。Issue #2已读取全部91条既有评论，与Issue评论计数一致，当日标记为0条；发布复核按标题搜索定位到[历史复核Issue](https://github.com/Sailin09/Store-Promotion/issues/3)，并读取正文及全部评论（0条）。历史113/116库存与累计62条均未作为本日报基线。

数据库无上限发布历史覆盖完整区间；两批实际inserted日志、12条数据库created_at与queue_id逐项对应，当前新增储备集合一致。调度瞬时错误覆盖限制及晚间报告根因缺证已如上列明。

[完整Markdown日报](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-08.md) · [配套JSON证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-08.json)。同一正文用于Issue #2当日唯一评论及本云端任务聊天；归档与评论读回成功后才推进成功截止。设备通知送达及聊天独立读回未确认。