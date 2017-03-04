From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Extending /memreserve/ to allow defining descriptions
Date: Sat, 4 Mar 2017 13:40:39 -0800
Message-ID: <9c1cb5e8-2afd-e266-72b9-20ca6622956e@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=U2urFiJt7a3GWm0Kmvk+p3D+wKripIEscjps+RuUlGM=;
        b=pE0Z+WNa0ixqbac867UAb/lcSXAx0gNE/MYL4+ZfINKh/i7aGCYJFKKqAs3PbW4DdF
         EhNFTqTPPgu4oZXAqzfChnMs9pV52hzab/+L9ffqPYIo+Cq14raQyZPNI2KQb27qTY/l
         2a+7iPIOMjYXzam+XaWi3kDAk2DDCb3gMYm9Y/QOdyhXKp7nMXPkXKXNqSTsgTz3De+W
         tWLUNksxbQLmnhw9gYxOyb2L3EHb5W+O1Io6nkmwCEnS8rubOghVlr4AGF99nvvLJrEY
         K/SqaIe1dCxbN84XJhneb5enU1zFbWG6PqIqkGdDuWjc9fF9kqhQz5c6JcG4bazuZko3
         +BKw==
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org

Hello,

I am considering extending the /memreserve node syntax with the ability
to pass a description string that would be describing what kind of
memory is being reserved here, e:g:

/memreserve/ 0x0 0x10000 type = "psci"

The rationale would be for a client program to be able to list these
reserved regions e.g: from /proc/iomem in a way that could be made
available to other applications.

What do you think?
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
