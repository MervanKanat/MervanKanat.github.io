---------------------------------Kullanilacak column sec
SELECT 
  [takip_id],
  [birim_atama_veya_devir_tarihi], -- Bu sütun adında bir yazım hatası varsa, lütfen doğrusu ile değiştirin.
  [asil_alacak_toplami], 
  [faiz_toplami_vd], -- Bu sütun adında bir yazım hatası varsa, lütfen doğrusu ile değiştirin.
  [masraf_toplami], 
  [ktvu_toplami_vh],
  [faiz_indirim_toplami_vd],
  [tahsil_fazla_toplami],
  [Proje],
  [musteri_nosu],
  [tahsilat_toplami],
  [tebligat_durumu]
INTO #per
FROM [TARGET-SQL].[PRM].[yts].[per];

--------------------------------------------risk ile birlestir 
SELECT 
  ed.*, 
  p.*
INTO archive.dbo.risk_subat_merge  -- Yeni kalıcı tablo
FROM [archive].[dbo].[risk_subat] AS ed
INNER JOIN #per AS p 
ON ed.dosya_numarasi = p.takip_id;

--------------------------------------------model icin verinin son join hazirla risk_subat_merge_soft
SELECT 
  CONVERT(bigint, rsm.[musteri_nosu]) AS musteri_no_rsm,
  CONVERT(bigint, es.[Musteri No]) AS musteri_no_es,
  rsm.*,  -- risk_subat_merge tablosundaki diğer sütunlar (gerekiyorsa belirli sütunları seçin)
  es.*    -- ekim_debt tablosundaki diğer sütunlar (gerekiyorsa belirli sütunları seçin)
INTO [archive].[dbo].[risk_subat_merge_soft]
FROM [archive].[dbo].[risk_subat_merge] AS rsm
INNER JOIN [archive].[dbo].[ekim_soft] AS es
ON CONVERT(bigint, rsm.[musteri_nosu]) = CONVERT(bigint, es.[Musteri No]);
------------------------------------------------------------------ sorgu
SELECT
  [Musteri No],
  [a_b_flag],
  [Sonuç Kodu],
  [Operasyonel Durum],
  [Sonlandı Mı],
  [Geçerli Mi],
  [Abonelik Durumu],
  [Due Amount],
  [Kredi Karti Varmi],
  [Tarife],
  [Otomatik Odeme Flag],
  COALESCE([Son6Ay Dondurma Adedi], 0) AS [Son6Ay Dondurma Adedi],
  ([Arama Sayısı] + [Meşgul Arama Sayısı]) AS ToplamAramaSayisi,
  DATEDIFF(WEEK, [Hat Aktivasyon Tarihi], GETDATE()) AS HataktifHaftalar,
  DATEDIFF(YEAR, [Musteri Dogum Tarihi], [birim_atama_veya_devir_tarihi]) AS BorcluOlunanYas,
  CAST([asil_alacak_toplami] AS FLOAT) + 
  CAST([faiz_toplami_vd] AS FLOAT) + 
  CAST([masraf_toplami] AS FLOAT) + 
  CAST([ktvu_toplami_vh] AS FLOAT) + 
  CAST([tahsil_fazla_toplami] AS FLOAT) AS BorcunBuyuklugu,
  CASE 
    WHEN [Sms Gonderildi Mi] = 'TRUE' THEN 1
    ELSE 0
  END AS SmsGonderildiFlag,
  CASE 
        WHEN [Son Odeme Kanali] = ' ' THEN 'Elektronik'
        ELSE [Son Odeme Kanali]
  END AS [Son Odeme Kanali],
  CASE 
        WHEN [Gender] = ' ' THEN 'E'
        ELSE [Gender]
  END AS [Gender],
  CASE 
    WHEN CAST([tahsilat_toplami] AS FLOAT) > 0 THEN 1
    ELSE 0
  END AS OdendiBilgisi,
  CASE 
    WHEN [risk_status] = 'low_risk' THEN 1
    ELSE 0
  END AS Potansiyel
FROM [archive].[dbo].[risk_subat_merge_debt];









