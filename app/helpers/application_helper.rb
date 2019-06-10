module ApplicationHelper
    def default_meta_tags
        {
            title: "本当に行きたい、行ったことがない場所が見つかる | siori",
            description: "自分の行った行き先を投稿し、他人の投稿のなかで、行ったことのある場所をチェックすると行ったことのない場所がわかるようになります。",
            keywords: "観光,旅行,旅,大阪,京都,兵庫,奈良,日帰り",
            canonical: request.original_url,
            carset: "UTF-8",
            
            og: {
                title: "行ったことのない穴場が見つかる",
                description: :description,
                type: "website",
                url: request.original_url,
                site_name: "siori",
                locale: "ja_JP",
            },
        }
        
    end
end
