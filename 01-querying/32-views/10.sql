SELECT english_title AS "10 Best Hokusai Prints" 
FROM views 
WHERE artist = "Hokusai" 
ORDER BY entropy DESC 
LIMIT 10;
+-----------------------------------------------------------------------------------+
|                              10 Best Hokusai Prints                               |
+-----------------------------------------------------------------------------------+
| Sunset across the Ryōgoku bridge from the bank of the Sumida River at Onmayagashi |
| Hodogaya on the Tōkaidō                                                           |
| Yoshida at Tōkaidō                                                                |
| Barrier Town on the Sumida River                                                  |
| Tama River in Musashi Province                                                    |
| Sazai hall - Temple of Five Hundred Rakan                                         |
| Bay of Noboto                                                                     |
| Mount Fuji from the mountains of Tōtōmi                                           |
| Cushion Pine at Aoyama                                                            |
| Senju, Musashi But                                                                |
+-----------------------------------------------------------------------------------+